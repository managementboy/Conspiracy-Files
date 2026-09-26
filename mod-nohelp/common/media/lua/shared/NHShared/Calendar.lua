-- Calendar arithmetic, kept here because it is pure: no engine, no ModData,
-- nothing to mock. That makes it the one part of the date book a plain Lua
-- test can check properly, which is why it does not live inside KnoxApps.
local M={}

M.MONTHS={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"}
local LENGTHS={31,28,31,30,31,30,31,31,30,31,30,31}

function M.leap(year)
    return year%4==0 and (year%100~=0 or year%400==0)
end

function M.monthLength(month,year)
    if type(month)~="number" or month<1 or month>12 then return 30 end
    if month==2 and M.leap(year) then return 29 end
    return LENGTHS[month]
end

-- Which weekday the 1st falls on, 1 = Sunday, which is how the Date Book began
-- its weeks. Zeller's congruence: no calendar library, and the date arithmetic
-- in this mod is already its own.
function M.firstWeekday(month,year)
    local m,y=month,year
    if m<3 then m=m+12; y=y-1 end
    local k,j=y%100,math.floor(y/100)
    local h=(1+math.floor(13*(m+1)/5)+k+math.floor(k/4)+math.floor(j/4)+5*j)%7
    return ((h+6)%7)+1        -- Zeller gives 0=Saturday; shift so 1=Sunday.
end

-- How many week rows a month needs. Six is the most any month can want, and
-- the grid is drawn to that, so this is worth being able to assert.
function M.rows(month,year)
    return math.ceil((M.monthLength(month,year)+M.firstWeekday(month,year)-1)/7)
end

return M
