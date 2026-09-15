-- Bounded, engine-free duration aggregation for later adapter profiling.
local PerfStats={}
local DEFAULT_BUDGET_MS=2

local function validDuration(value)
    return type(value)=="number" and value>=0 and value<math.huge
end

function PerfStats.new(options)
    options=options or {}
    local maxLabels=options.maxLabels or 8
    local nameLimit=options.nameLimit or 48
    local defaultBudget=options.budgetMs or DEFAULT_BUDGET_MS
    assert(type(maxLabels)=="number" and maxLabels==math.floor(maxLabels) and maxLabels>=1 and maxLabels<=64)
    assert(type(nameLimit)=="number" and nameLimit==math.floor(nameLimit) and nameLimit>=1 and nameLimit<=128)
    assert(validDuration(defaultBudget))
    local entries,count={},0
    local api={}

    function api.record(name,duration,budgetMs)
        if type(name)~="string" or name=="" or #name>nameLimit then return false,"invalid label" end
        if not validDuration(duration) then return false,"invalid duration" end
        budgetMs=budgetMs==nil and defaultBudget or budgetMs
        if not validDuration(budgetMs) then return false,"invalid budget" end
        local entry=entries[name]
        if not entry then
            if count>=maxLabels then return false,"label capacity reached" end
            entry={name=name,count=0,totalMs=0,peakMs=0,overBudget=0}; entries[name]=entry; count=count+1
        end
        entry.count=entry.count+1; entry.totalMs=entry.totalMs+duration
        if duration>entry.peakMs then entry.peakMs=duration end
        if duration>budgetMs then entry.overBudget=entry.overBudget+1 end
        return true
    end

    function api.snapshot()
        local rows={}
        for _,entry in pairs(entries) do rows[#rows+1]={name=entry.name,count=entry.count,totalMs=entry.totalMs,peakMs=entry.peakMs,overBudget=entry.overBudget} end
        table.sort(rows,function(a,b) return a.name<b.name end)
        return {maxLabels=maxLabels,labelCount=count,budgetMs=defaultBudget,rows=rows}
    end

    function api.reset() entries={}; count=0 end
    return api
end

return PerfStats
