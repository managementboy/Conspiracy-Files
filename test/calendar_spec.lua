-- The date book's arithmetic, checked against real 1993 dates. This is the one
-- part of the calendar a plain Lua test can reach: it touches no engine, so
-- there is nothing to mock and no excuse for not asserting it.
local Calendar = require("ConspiracyFiles/Calendar")

test("the calendar agrees with real 1993 dates", function()

-- 1 = Sunday, as the Date Book began its weeks.
local SUN, MON, TUE, WED, THU, FRI, SAT = 1, 2, 3, 4, 5, 6, 7

-- The game's own start date is 9 July 1993, so this month matters most.
assertEqual(THU, Calendar.firstWeekday(7, 1993), "1 Jul 1993 was a Thursday")
assertEqual(FRI, Calendar.firstWeekday(1, 1993), "1 Jan 1993 was a Friday")
assertEqual(WED, Calendar.firstWeekday(12, 1993), "1 Dec 1993 was a Wednesday")
assertEqual(SAT, Calendar.firstWeekday(5, 1993), "1 May 1993 was a Saturday")
-- A leap year, and a century that is not one.
assertEqual(THU, Calendar.firstWeekday(2, 2024), "1 Feb 2024 was a Thursday")
assertEqual(MON, Calendar.firstWeekday(1, 1900), "1 Jan 1900 was a Monday")

assertEqual(31, Calendar.monthLength(7, 1993), "July has 31 days")
assertEqual(28, Calendar.monthLength(2, 1993), "February 1993 has 28")
assertEqual(29, Calendar.monthLength(2, 1996), "February 1996 is a leap year")
assertEqual(28, Calendar.monthLength(2, 1900), "1900 is not a leap year")
assertEqual(29, Calendar.monthLength(2, 2000), "2000 is a leap year")

assertTrue(Calendar.leap(1996), "1996 is a leap year")
assertTrue(not Calendar.leap(1997), "1997 is not")
assertTrue(not Calendar.leap(1900), "1900 is not, despite dividing by 4")
assertTrue(Calendar.leap(2000), "2000 is, because it divides by 400")

-- A month that does not fit the grid would be silently clipped on screen, so
-- assert the drawn six rows are always enough. Every month for a decade.
for year = 1993, 2003 do
    for month = 1, 12 do
        local rows = Calendar.rows(month, year)
        assertTrue(rows >= 4 and rows <= 6,
            "month " .. month .. "/" .. year .. " needs " .. rows .. " rows; the grid draws 6")
    end
end

-- Nonsense must not throw: the month comes from the engine's clock and a bad
-- read should degrade, not crash the screen mid-draw.
assertEqual(30, Calendar.monthLength(nil, 1993), "a missing month falls back")
assertEqual(30, Calendar.monthLength(13, 1993), "an impossible month falls back")
end)
