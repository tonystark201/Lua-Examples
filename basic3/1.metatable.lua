-- Code refer to Programming in Lua

-- Arithmetic Metamethods
local set = require("modules.set")

local mt = {}

function set.new (list) 
    local set = {}
    setmetatable(set, mt)
    if #list >0 then 
        for _, v in ipairs(list) do 
            set[v] = true 
        end
    end 
    return set
end
   
s1 = set.new({1,2,3,4})
s2 = set.new({2,3,4,5})
print(getmetatable(s1)) 
print(getmetatable(s2)) 

mt.__add = set.union
mt.__mul = set.intersection

print(set.tostring(s1+s2))
print(set.tostring(s1*s2))

-- Relational Metamethods

-- subset
mt.__le = function (s1, s2) 
    for k in pairs(s1) do
        if not s2[k] then return false end
    end
    return true
end

-- proper subset
mt.__lt = function (s1, s2) 
    return s1 <= s2 and not (s2 <= s1)
end

s1 = set.new{1,2,3}
s2 = set.new{1,2,3,4,5}
print(s1 <= s2)
print(s1 < s2)

-- Library-Defined Metamethods
mt.__tostring = set.tostring

print(s1)
print(s2)

--[[
    __index
    __newindex

]]

-- __index
local tb = {
    name = "james"
}
local mt = {
    __index = function (t,k)
        print("Empty")
    end
}
setmetatable(tb,mt)
print(tb.age)

-- _newindex
tb = {}
local proxy = tb
tb = {}

local mt = {
    __index = function (t,k)
        print("Access element: "..tostring(k))
        return proxy[k]
    end,
    __newindex = function (t,k,v)
        print("Set element: "..tostring(k).." as "..tostring(v))
        proxy[k] = v
    end
}
setmetatable(tb,mt)
tb["name"] = "James"
print(tb["name"])

-- readonly table
function readOnly (t)
    local proxy = {}
    local mt = { 
        __index = t,
        __newindex = function (t,k,v)
        error("attempt to update a read-only table", 2)
        end
    }
    setmetatable(proxy, mt)
    return proxy
end

