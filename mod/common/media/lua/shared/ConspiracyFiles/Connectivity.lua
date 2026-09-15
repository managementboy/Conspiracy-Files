-- Pure-domain reachability: bounded 3D flood fill over a caller-supplied
-- passability oracle. No PZ runtime dependency whatsoever -- the caller
-- injects every world fact (which squares are walkable, which pairs of
-- adjacent squares are separated by a wall, which squares are joined by a
-- staircase). This module never calls getCell(), getPlayer() or any other
-- engine API, so it is testable with plain Lua mocks.
--
-- The incident this exists to prevent: a clue placed in a basement room with
-- no walkable path to it. Horizontal adjacency alone is not enough to prove
-- reachability across floors -- two squares stacked in z are NOT connected
-- unless the caller explicitly declares a stair link between them. Getting
-- that wrong (treating z-adjacency as free movement) is the exact bug.
local M = {}

M.SCHEMA = 1

-- Caller-supplied request limits (defensive, not just a courtesy).
M.MAX_ANCHORS = 64
M.MAX_STAIRS = 512
M.MAX_BLOCKED_EDGES = 2048

-- Hard caps: a request may ask for less, never more. Exceeding either one
-- flips the result to "incomplete" -- it must never be reported as a
-- proven-unreachable false negative.
M.HARD_MAX_VISITED = 20000
M.HARD_MAX_STEPS = 40000
M.HARD_STEP_BUDGET = 256

M.DEFAULT_MAX_VISITED = 4000
M.DEFAULT_MAX_STEPS = 8000
M.DEFAULT_STEP_BUDGET = 48

local REQUEST_FIELDS = {
    anchors = true, passable = true, stairs = true, blockedEdges = true,
    maxVisited = true, maxSteps = true, stepBudget = true,
}
local SQUARE_FIELDS = { x = true, y = true, z = true }
local STAIR_FIELDS = { x1 = true, y1 = true, z1 = true, x2 = true, y2 = true, z2 = true, twoWay = true }
local EDGE_FIELDS = { x1 = true, y1 = true, z1 = true, x2 = true, y2 = true, z2 = true }
local RESULT_FIELDS = { schema = true, completed = true, visitedCount = true, stepsTaken = true, squares = true }

local function plain(t) return type(t) == "table" and not getmetatable(t) end
local function finite(v) return type(v) == "number" and v == v and v ~= math.huge and v ~= -math.huge end
local function coord(v) return finite(v) and v % 1 == 0 end
local function allowed(t, fields)
    for k in pairs(t) do if not fields[k] then return false end end
    return true
end

-- Dense 1..n array check shared by anchors/stairs/blockedEdges.
local function denseArray(t, max)
    if not plain(t) then return nil end
    local n = 0
    for k in pairs(t) do
        if type(k) ~= "number" or k % 1 ~= 0 or k < 1 or k > max then return nil end
        n = n + 1
    end
    if n > max then return nil end
    for i = 1, n do if t[i] == nil then return nil end end
    return n
end

local function key(x, y, z) return x .. ":" .. y .. ":" .. z end

local function validSquare(s)
    return plain(s) and allowed(s, SQUARE_FIELDS) and coord(s.x) and coord(s.y) and coord(s.z)
end

local function validStair(s)
    if not plain(s) or not allowed(s, STAIR_FIELDS) then return false end
    if not (coord(s.x1) and coord(s.y1) and coord(s.z1) and coord(s.x2) and coord(s.y2) and coord(s.z2)) then return false end
    if s.twoWay ~= nil and type(s.twoWay) ~= "boolean" then return false end
    if s.z1 == s.z2 then return false end -- stairs are the ONLY way to change z; a link must actually cross floors
    if s.x1 == s.x2 and s.y1 == s.y2 and s.z1 == s.z2 then return false end
    return true
end

local function validEdge(e)
    if not plain(e) or not allowed(e, EDGE_FIELDS) then return false end
    if not (coord(e.x1) and coord(e.y1) and coord(e.z1) and coord(e.x2) and coord(e.y2) and coord(e.z2)) then return false end
    if e.z1 ~= e.z2 then return false end -- a blocked edge is a wall between two squares on the same floor
    local dx, dy = e.x2 - e.x1, e.y2 - e.y1
    if not ((dx == 0 and (dy == 1 or dy == -1)) or (dy == 0 and (dx == 1 or dx == -1))) then return false end
    return true
end

local function clampInt(v, default, hardMax)
    if v == nil then return default end
    if math.floor(v) < hardMax then return v end
    return hardMax
end

-- Validate the request. Returns true, or false, reason. Never touches
-- request.passable's behaviour -- only checks that it is callable-shaped.
local function validateRequest(request)
    if not plain(request) then return false, "request must be a table" end
    if not allowed(request, REQUEST_FIELDS) then return false, "unknown request field" end
    if type(request.passable) ~= "function" then return false, "passable must be a function" end

    local anchorCount = denseArray(request.anchors, M.MAX_ANCHORS)
    if not anchorCount or anchorCount < 1 then return false, "anchors must be a non-empty dense array" end
    for i = 1, anchorCount do
        if not validSquare(request.anchors[i]) then return false, "invalid anchor square" end
    end

    if request.stairs ~= nil then
        local stairCount = denseArray(request.stairs, M.MAX_STAIRS)
        if not stairCount then return false, "stairs must be a dense array" end
        for i = 1, stairCount do
            if not validStair(request.stairs[i]) then return false, "invalid stair link" end
        end
    end

    if request.blockedEdges ~= nil then
        local edgeCount = denseArray(request.blockedEdges, M.MAX_BLOCKED_EDGES)
        if not edgeCount then return false, "blockedEdges must be a dense array" end
        for i = 1, edgeCount do
            if not validEdge(request.blockedEdges[i]) then return false, "invalid blocked edge" end
        end
    end

    for _, name in ipairs({ "maxVisited", "maxSteps", "stepBudget" }) do
        local v = request[name]
        if v ~= nil and not (coord(v) and v >= 1) then return false, name .. " must be a positive integer" end
    end

    return true
end

-- Build the two-way "wall" lookup: blocked[a][b] == true iff a<->b is blocked.
local function buildBlockMap(request)
    local blocked = {}
    if not request.blockedEdges then return blocked end
    for i = 1, #request.blockedEdges do
        local e = request.blockedEdges[i]
        local ka, kb = key(e.x1, e.y1, e.z1), key(e.x2, e.y2, e.z2)
        blocked[ka] = blocked[ka] or {}
        blocked[ka][kb] = true
        blocked[kb] = blocked[kb] or {}
        blocked[kb][ka] = true
    end
    return blocked
end

-- Build the directed stair adjacency: stairs[a] = { {x,y,z}, ... }.
local function buildStairMap(request)
    local stairs = {}
    if not request.stairs then return stairs end
    for i = 1, #request.stairs do
        local s = request.stairs[i]
        local ka, kb = key(s.x1, s.y1, s.z1), key(s.x2, s.y2, s.z2)
        stairs[ka] = stairs[ka] or {}
        stairs[ka][#stairs[ka] + 1] = { x = s.x2, y = s.y2, z = s.z2 }
        if s.twoWay ~= false then
            stairs[kb] = stairs[kb] or {}
            stairs[kb][#stairs[kb] + 1] = { x = s.x1, y = s.y1, z = s.z1 }
        end
    end
    return stairs
end

local NEIGHBOUR_OFFSETS = { { 1, 0 }, { -1, 0 }, { 0, 1 }, { 0, -1 } }

-- Start an incremental reachability search. Returns a step function the
-- caller drives across frames (never an unbounded loop): each call does at
-- most `stepBudget` node expansions and returns false while more work
-- remains, or true once finished -- at which point `done(result)` has
-- already been called exactly once. Mirrors WorldAccess.candidateScan's
-- incremental-step convention.
--
-- Anchors are seeded as visited unconditionally: they are the caller's
-- declared starting squares (e.g. "the player is standing here"), not
-- claims that need re-proving against the passability oracle.
function M.search(request, done)
    local ok, why = validateRequest(request)
    if not ok then return nil, why end
    if type(done) ~= "function" then return nil, "done must be a function" end

    local passable = request.passable
    local blocked = buildBlockMap(request)
    local stairs = buildStairMap(request)

    local maxVisited = clampInt(request.maxVisited, M.DEFAULT_MAX_VISITED, M.HARD_MAX_VISITED)
    local maxSteps = clampInt(request.maxSteps, M.DEFAULT_MAX_STEPS, M.HARD_MAX_STEPS)
    local stepBudget = clampInt(request.stepBudget, M.DEFAULT_STEP_BUDGET, M.HARD_STEP_BUDGET)

    local visited, visitedCount = {}, 0
    local queue, head, tail = {}, 1, 0
    local stepsTaken = 0
    local capped = false
    local finished = false
    local doneCalled = false

    local function mark(x, y, z)
        local k = key(x, y, z)
        if visited[k] then return end
        if visitedCount >= maxVisited then capped = true; return end
        visited[k] = true
        visitedCount = visitedCount + 1
        tail = tail + 1
        queue[tail] = { x = x, y = y, z = z }
    end

    for i = 1, #request.anchors do
        local a = request.anchors[i]
        mark(a.x, a.y, a.z)
    end

    local function finish()
        finished = true
        if doneCalled then return end
        doneCalled = true
        local squares = {}
        for k in pairs(visited) do squares[k] = true end
        done({
            schema = M.SCHEMA,
            completed = not capped,
            visitedCount = visitedCount,
            stepsTaken = stepsTaken,
            squares = squares,
        })
    end

    return function()
        if finished then return true end
        local processed = 0
        while processed < stepBudget do
            if capped then finish(); return true end
            if head > tail then finish(); return true end
            if stepsTaken >= maxSteps then capped = true; finish(); return true end

            local node = queue[head]
            queue[head] = nil
            head = head + 1
            stepsTaken = stepsTaken + 1
            processed = processed + 1

            local nk = key(node.x, node.y, node.z)
            for _, d in ipairs(NEIGHBOUR_OFFSETS) do
                local nx, ny = node.x + d[1], node.y + d[2]
                local blockedSet = blocked[nk]
                if not (blockedSet and blockedSet[key(nx, ny, node.z)]) then
                    if passable(nx, ny, node.z) then mark(nx, ny, node.z) end
                end
                if capped then finish(); return true end
            end

            local links = stairs[nk]
            if links then
                for _, t in ipairs(links) do
                    if passable(t.x, t.y, t.z) then mark(t.x, t.y, t.z) end
                    if capped then finish(); return true end
                end
            end
        end
        return false
    end
end

-- Run a search to completion synchronously (for tests and other non-framed
-- callers). Still respects every cap -- it just drives the step loop itself
-- instead of handing it to the caller's frame scheduler.
function M.searchAll(request)
    local result
    local step, why = M.search(request, function(r) result = r end)
    if not step then return nil, why end
    local guard = 0
    while not step() do
        guard = guard + 1
        if guard > M.HARD_MAX_STEPS then break end -- belt and suspenders; search() already self-caps
    end
    return result
end

function M.validateResult(result)
    if not plain(result) then return false, "result must be a table" end
    if not allowed(result, RESULT_FIELDS) then return false, "unknown result field" end
    if result.schema ~= M.SCHEMA then return false, "unknown result schema" end
    if type(result.completed) ~= "boolean" then return false, "completed must be a boolean" end
    if not (coord(result.visitedCount) and result.visitedCount >= 0) then return false, "invalid visitedCount" end
    if not (coord(result.stepsTaken) and result.stepsTaken >= 0) then return false, "invalid stepsTaken" end
    if not plain(result.squares) then return false, "squares must be a table" end
    for k, v in pairs(result.squares) do
        if type(k) ~= "string" or v ~= true then return false, "invalid squares entry" end
    end
    return true
end

-- Proven-reachable query. Distinguishes three outcomes for the caller:
--   true  -> the square was actually visited by the flood fill
--   false -> the square was NOT visited (only meaningful as a proof of
--            unreachability when result.completed is also true; an
--            incomplete search returning false means "not yet proven",
--            not "proven unreachable" -- callers MUST check completed)
--   nil, reason -> malformed result or coordinates; never silently false
function M.reachable(result, x, y, z)
    local ok, why = M.validateResult(result)
    if not ok then return nil, why end
    if not (coord(x) and coord(y) and coord(z)) then return nil, "invalid coordinates" end
    return result.squares[key(x, y, z)] == true
end

-- Copy-on-write summary: counts plus the completed flag, decoupled from the
-- result's internal squares table.
function M.summary(result)
    local ok, why = M.validateResult(result)
    if not ok then return nil, why end
    return {
        completed = result.completed,
        visitedCount = result.visitedCount,
        stepsTaken = result.stepsTaken,
    }
end

return M
