-- WHAT THE SURVIVOR IS FOLLOWING, GROUPED BY THE THREAD IT BELONGS TO.
--
-- Owner, Windows playtest 2026-09-25: "PDA app that tracks 'cases' (should be
-- called differently, as we are not an investigator, we are a survivor).
-- Currently we only have an ever longer list of files."
--
-- FILES is one flat list in discovery order and only grows. Nothing said which
-- findings belong together, which threads are still live, or let the survivor
-- put one down. This module is the grouping; THREADS in KnoxApps is the screen.
--
-- THE WORD. Not "case", not "investigation" - those are an investigator's, and
-- the survivor is not one. A thread is what you follow and what you can let go
-- of, and it is already the word the continuity design uses for the same thing
-- (PHASE_C_CONTINUITY_CARRIER.md, `case.thread`). DR-20260925-THREADS.
--
-- WHAT IT MUST NEVER DO (DR-20260920-NO-CONCLUSION). It groups what the
-- survivor is carrying; it does not score it. So:
--   * no count of anything against a total - not "3 of 7", not "2 open";
--   * "put down" never reads as "solved", "closed" or "finished". A thread the
--     survivor sets aside is set aside, and a thread nothing more came of is
--     exactly that;
--   * the central question is never named here. A thread is labelled by the
--     finding that started it, in the survivor's own words.
--
-- CHRONOLOGY IS NOT TOUCHED. FILES keeps its discovery order and its numbers;
-- rows arrive here already numbered and keep both. Grouping is a second view
-- over the same rows, exactly as PLACES is (P4-R81).
--
-- Pure: no PZ dependency, so the whole grouping is testable in plain Lua.
local M={}

M.FOLLOWING="STILL FOLLOWING"
M.PUT_DOWN="PUT DOWN"
M.LOOSE="ON THEIR OWN"

M.LOOSE_NOTE="Things I picked up that are not part of anything I am following. Yet."
M.STILL="I am still following this one."
M.SET_ASIDE="I put this one down. That is my choice, not an answer."
M.RAN_OUT="Nothing more has come of this one."

-- `threadOf(row)` returns the thread this row belongs to, or nil for a finding
-- that belongs to none: a table of
--   key       - what makes two rows the same thread. The chain's own id, so a
--               follow-up sits with the finding it followed rather than
--               starting a second heading.
--   question  - the question the thread has not settled, when the record still
--               carries one. A retired root keeps no case envelope, so this is
--               often absent and the thread is labelled by its first finding.
--   spent     - true when nothing more is coming from this thread.
-- `putDown[key]` is true for a thread the survivor has set aside by hand.
function M.build(rows,threadOf,putDown)
    putDown=putDown or {}
    local order,byKey={},{}
    for _,row in ipairs(rows or {}) do
        if not row.cfHeading then
            local info=threadOf and threadOf(row) or nil
            local key=info and info.key or nil
            local group=byKey[key or M.LOOSE]
            if not group then
                group={key=key,question=info and info.question or nil,
                       spent=info and info.spent or false,rows={},
                       label=tostring(row.title or "")}
                byKey[key or M.LOOSE]=group
                order[#order+1]=group
            end
            -- A thread is spent only when every root behind it is; one live
            -- root keeps it live.
            if not (info and info.spent) then group.spent=false end
            if info and info.question and not group.question then group.question=info.question end
            group.rows[#group.rows+1]=row
        end
    end
    local sections={{title=M.FOLLOWING,threads={}},{title=M.PUT_DOWN,threads={}},
                    {title=M.LOOSE,threads={}}}
    for _,group in ipairs(order) do
        local lines={}
        if group.key==nil then
            lines[#lines+1]=M.LOOSE_NOTE
        else
            if group.question then lines[#lines+1]="What I still want to know: "..group.question end
            lines[#lines+1]="It started with: "..group.label.."."
            if putDown[group.key] then lines[#lines+1]=M.SET_ASIDE
            elseif group.spent then lines[#lines+1]=M.RAN_OUT
            else lines[#lines+1]=M.STILL end
        end
        group.detail=table.concat(lines,"\n\n")
        local into=3
        if group.key~=nil then into=(putDown[group.key] or group.spent) and 2 or 1 end
        local bucket=sections[into].threads
        bucket[#bucket+1]=group
    end
    local out={}
    for _,section in ipairs(sections) do
        if #section.threads>0 then out[#out+1]=section end
    end
    return out
end

-- Whether the survivor may put this thread down by hand. A thread nothing more
-- has come of is already where it belongs and there is nothing to decide; one
-- the survivor set aside can always be picked back up.
function M.canSetAside(group) return group~=nil and group.key~=nil end

return M
