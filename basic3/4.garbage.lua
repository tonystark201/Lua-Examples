-- Weak Tables
STable = {}
STable[1] = function() return nil end
STable[2] = function() print("empty") end
STable[3] = {1,2,3}

print(#STable)
collectgarbage()         
print(#STable)

WTable = {}
WTable[1] = function() return nil end
WTable[2] = function() print("empty") end
WTable[3] = {1,2,3}

setmetatable(WTable, {__mode = "v"})

print(#WTable)

ref = WTable[1]    -- add ref to first element
collectgarbage()   

ref = nil          -- lose ref of first element
print(#WTable)

-- Weak Table Usage: Memorize Functions
local results = {}
setmetatable(results, {__mode = "v"}) -- make values weak
function createPerson (name,age)
    local key = string.format("%s-%d", name,age)
    local person = results[key]
    if person == nil then
        person = {name=name,age=age}
        results[key] = person
    end
    return person
end

-- Weak Table Usage: Object Attributes
local defaults = {}
setmetatable(defaults, {_mode = "k"})
local mt = {__index = function(t) return defaults[t] end}
function setDefault(t, d)
    defaults[t] = d
    setmetatable(t, mt)
end

-- Weak Table Usage: Tables with Default Values
metas = {}
setmetatable(metas, {__mode = "v"})
setdefault = function (t, d)
    local mt = metas[d]
    if mt == nil then
        mt = {__index = function() return d end}
        metas[d] = mt
    end
    setmetatable(t, mt)
end

-- Finalizers
print("Finalizers")
mt = {}
obj = setmetatable({},mt)
mt.__gc = function() print("GC DONE") end

setmetatable(obj,mt)

-- Garbage Collector Functions
print("Garbage Collector Functions")
local t = {"1", "2", "3"}
print(collectgarbage("count"))
local t = nil
print(collectgarbage("count"))
