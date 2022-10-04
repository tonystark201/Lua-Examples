-- time
print(os.time())
print(os.time({year=2020,month=12,day=30}))
print(os.time({year=1970,month=1,day=1,hour=8}))

-- date
print(os.date("Weekday name: %a, %A"))
print(os.date("Month name: %b, %B"))
print(os.date("datetime: %c"))
print(os.date("Day of Month: %d"))
print(os.date("Hours: %I, %H"))
print(os.date("Day of Year: %j"))
print(os.date("Month: %m"))
print(os.date("Minute: %M"))
print(os.date("AM or PM: %p"))
print(os.date("Second: %S"))
print(os.date("Weekday: %w"))
print(os.date("Week of the year: %W"))
print(os.date("Date: %x"))
print(os.date("Time: %X"))
print(os.date("Year: %Y, %y"))
print(os.date("Timezone: %z"))

-- Manipulation
local day1=os.time({year=2020,month=1,day=1})
local day2=os.time({year=2020,month=2,day=1})
local delta_time=os.difftime(day2,day1)
print(delta_time,delta_time/(24*3600))

local t = os.date("*t")
print(os.date("%Y--%m--%d",os.time(t)))
t.day=t.day-10
print(os.date("%Y--%m--%d",os.time(t)))
