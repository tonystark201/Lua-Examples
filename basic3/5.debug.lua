-- Accessing local variables
print("Accessing local variables")
function foo (a, b)
    local x
    do local c = a - b end
        local a = 1
    while true do
        local name, value = debug.getlocal(1, a)
        if not name then break end
        print(name, value)
        a = a + 1
    end
end

foo(1,2)

-- getupvalue, setupvalue
print("getupvalue, setupvalue example")
function newCounter()
    local n = 0
    local k = 0   
    return function()
        k = n
        n = n + 1
        return n
    end
end

counter = newCounter()
print(counter())
print(counter())

local i = 1

repeat
    name, val = debug.getupvalue(counter, i)
    if name then
        print ("index", i, name, "=", val)   
        if(name == "n") then
            debug.setupvalue (counter,2,10)
        end  
        i = i + 1
    end
until not name
print(counter())


-- Getting the name of a function
print("Getting the name of a function")
local Counters = {}
local Names = {}

function getname (func)
    local n = Names[func]
    if n.what == "C" then
        return n.name
    end
    local lc = string.format("[%s]:%d", n.short_src, n.linedefined)
    if n.what ~= "main" and n.namewhat ~= "" then
        return string.format("%s (%s)", lc, n.name)
    else
        return lc
    end
end

for func, count in ipairs(Counters) do
    print(getname(func), count)
end