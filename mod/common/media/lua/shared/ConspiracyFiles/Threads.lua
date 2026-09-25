-- WHAT THE SURVIVOR IS FOLLOWING, ONE ROW PER THREAD.
--
-- Owner, Windows playtest 2026-09-25: "PDA app that tracks 'cases' (should be
-- called differently, as we are not an investigator, we are a survivor).
-- Currently we only have an ever longer list of files." And on the first
-- screen built for it, the same day: "that is a bad UI design. Even the
-- palmpilot had better." docs/design/THREADS_SCREEN_REDESIGN_2026-09-25.md
-- has the faults and the shape this module now serves.
--
-- THE WORD. Not "case", not "investigation" - those are an investigator's, and
-- the survivor is not one. A thread is what you follow and what you can let go
-- of, and it is already the word the continuity design uses for the same thing
-- (PHASE_C_CONTINUITY_CARRIER.md, `case.thread`). DR-20260925-THREADS.
--
-- THE SHAPE. The device has two list idioms and this uses both, nothing else:
--   * a category picker in the title bar - Following / Put down / All - where
--     the first screen printed section headings into the list;
--   * one row per thread, and tapping it opens the thread as a record whose
--     entries are its findings, exactly as a DATES day opens (KnoxApps builds
--     the record; the shell needs no change).
--
-- WHAT IT MUST NEVER DO (DR-20260920-NO-CONCLUSION). It groups what the
-- survivor is carrying; it does not score it. No count of anything against a
-- total; "put down" never reads as "solved", "closed" or "finished"; the
-- central question is never named here.
--
-- CHRONOLOGY IS NOT TOUCHED. FILES keeps its discovery order and its numbers;
-- rows arrive here already numbered and keep both inside the thread.
--
-- Pure: no PZ dependency, so the whole grouping is testable in plain Lua.
local M={}

M.CATEGORIES={"Following","Put down","All"}
M.FOLLOWING,M.PUT_DOWN,M.ALL=M.CATEGORIES[1],M.CATEGORIES[2],M.CATEGORIES[3]

-- Findings that belong to no thread are one row, opened the same way.
M.LOOSE_LABEL="Things I have not placed"
M.LOOSE_NOTE="Things I picked up that are not part of anything I am following. Yet."

M.STILL="I am still following this one."
M.SET_ASIDE="I have put this one down. That is my choice, not an answer."
M.RAN_OUT="Nothing more has come of this one."

-- The survivor's closing note on a thread they put down, appended to its
-- findings at draw time and never stored: the save keeps a flag, the record
-- reads as their own words. Several, chosen by the thread's key, so two
-- threads put down do not carry the same sentence and a reload shows the
-- same one - one fixed sentence would show the toggle as plainly as a box.
M.CLOSING={
    "Put this down. I could not get further, and I have stopped looking - for now.",
    "Leaving this here. Not because it is answered; because I have nothing to add.",
    "Set this aside. If something turns up, I will pick it up again.",
    "Stopped carrying this one. The question stands; I do not.",
}

-- The row on the list is about this wide (K.fit cuts with an ellipsis).
M.ROW=31

-- `threadOf(row)` returns the thread this row belongs to, or nil for a finding
-- that belongs to none: a table of
--   key       - what makes two rows the same thread (the chain's own id)
--   question  - the question the thread has not settled, when the record still
--               carries one; a retired root keeps no case envelope
--   spent     - true when nothing more is coming from this thread
-- `putDown[key]` is true for a thread the survivor has set aside by hand.
--
-- Returns the threads in the order their first finding was discovered, each:
--   key, question, label (first finding's title), rows, spent, putDown,
--   state = "following" | "putdown" | "loose"
function M.threads(rows,threadOf,putDown)
    putDown=putDown or {}
    local order,byKey={},{}
    for _,row in ipairs(rows or {}) do
        if not row.cfHeading then
            local info=threadOf and threadOf(row) or nil
            local key=info and info.key or nil
            local group=byKey[key or M.LOOSE_LABEL]
            if not group then
                group={key=key,question=info and info.question or nil,
                       spent=info and info.spent or false,rows={},
                       label=tostring(row.title or "")}
                byKey[key or M.LOOSE_LABEL]=group
                order[#order+1]=group
            end
            -- A thread is spent only when every root behind it is; one live
            -- root keeps it live.
            if not (info and info.spent) then group.spent=false end
            if info and info.question and not group.question then group.question=info.question end
            group.rows[#group.rows+1]=row
        end
    end
    for _,group in ipairs(order) do
        group.putDown=group.key~=nil and putDown[group.key]==true or false
        if group.key==nil then group.state="loose"
        elseif group.putDown or group.spent then group.state="putdown"
        else group.state="following" end
    end
    return order
end

-- What a category shows. Following: the live threads and the things not yet
-- placed - both are what the survivor is carrying. Put down: what they set
-- aside, and what nothing more came of. All: everything.
function M.filter(threads,category)
    local out={}
    for _,t in ipairs(threads or {}) do
        local show
        if category==M.PUT_DOWN then show=t.state=="putdown"
        elseif category==M.ALL or category==nil then show=true
        else show=t.state~="putdown" end
        if show then out[#out+1]=t end
    end
    return out
end

-- The one line the record says about where the survivor stands with it.
function M.stateLine(t)
    if t.key==nil then return M.LOOSE_NOTE end
    if t.putDown then return M.SET_ASIDE end
    if t.spent then return M.RAN_OUT end
    return M.STILL
end

-- The closing note, for a thread the survivor put down by hand. Stable per
-- thread: the key's characters pick the sentence.
function M.closingLine(t)
    if not (t and t.putDown) then return nil end
    local n=0
    for i=1,#tostring(t.key) do n=(n*31+tostring(t.key):byte(i))%1000003 end
    return M.CLOSING[(n%#M.CLOSING)+1]
end

-- THE ROW HANDLE (redesign note, remedy A). A thread's row carries its open
-- question, in the survivor's words. Measured 2026-09-25: 74 of 75 shipped
-- questions differ inside a row, and the five that collide are the openings
-- that begin "Why was I ..." - the first thing every game shows. So a question
-- that would not fit is front-loaded where the words are written: the frame
-- moves to the end and the thing that tells the threads apart leads.
--   "Why was I expected at this address?" -> "Expected at this address - why me?"
-- A retired thread keeps no question and is named by its first finding.
-- Only frames whose remainder still reads as the survivor's sentence when it
-- leads; "Why did the radio fail" would not, and stays as written.
local FRAMES={
    {"^[Ww]hy was I (.+)%?$"," - why me?"},
    {"^[Ww]hy did I (.+)%?$"," - why did I?"},
    {"^[Ww]hy is there (.+)%?$"," - why is it there?"},
    {"^[Ww]hy was there (.+)%?$"," - why was it there?"},
}
function M.handle(t)
    local q=t and (t.question or t.label) or ""
    if t and t.key==nil then return M.LOOSE_LABEL end
    if #q<=M.ROW then return q end
    for _,frame in ipairs(FRAMES) do
        local rest=q:match(frame[1])
        if rest then
            local lead=rest:sub(1,1):upper()..rest:sub(2)
            return lead..frame[2]
        end
    end
    return q
end

-- Handles for a list of threads, distinct within the row's width. When two
-- would still read alike - the risk remedy A names - the later one is led by
-- where its first finding was found, which is the other thing the survivor
-- knows about it; two threads from one street are left as they are and said
-- so by the caller's test rather than hidden.
function M.handles(threads)
    local out,seen={},{}
    for i,t in ipairs(threads or {}) do
        local h=M.handle(t)
        local short=h:sub(1,M.ROW)
        if seen[short] then
            local place=t.rows and t.rows[1] and t.rows[1].place
            if type(place)=="string" and place~="" then
                h=place..": "..h
                short=h:sub(1,M.ROW)
            end
        end
        seen[short]=true
        out[i]=h
    end
    return out
end

-- Whether the survivor may put this thread down by hand. A finding in no
-- thread has nothing to put down; a thread nothing more has come of is
-- already where it belongs, and one set aside can always be picked back up.
function M.canSetAside(t) return t~=nil and t.key~=nil end

return M
