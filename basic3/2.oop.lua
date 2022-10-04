
-- Class
print("Init Class")

Car = {brand = "", color = "", wheels = 0}

function Car:new(tb,brand,color,wheels)
    tb = tb or {}
    setmetatable(tb, self)
    self.__index = self
    self.brand = brand or ""
    self.color = color or ""
    self.wheels = wheels or 0;
    return tb
end

function Car:toString()
    local str = string.format("[Car] brand:%s, color:%s, wheels:%s\n",self.brand,self.color,self.wheels)
    print(str)
end

local car1 = Car:new(nil,"Audi","black",4)
car1:toString()

-- __index is a table

local Bird = { category = "turtledove" }
function Bird:new(o)
	o = o or {}
	setmetatable(o, {__index = Bird})
	return o
end

function Bird:getName()
	return self.name
end

function Bird:setName(name)
	self.name = name
end

local a = Bird:new({name = "Bird A"})
print("Bird Name:",a:getName()) 
print("Bird Group:",a.group)

-- __index is a function
local Bird = {}
Bird.meta = {
    group = "turtledove",
    getName = function ()
        return "Bird B"
    end
}
function Bird:new(o)
	o = o or {}
	setmetatable(o, {
        __index = function (t,k)
            return Bird.meta[k]
        end
    })
	return o
end
local a = Bird:new()
print("Bird Name:",a:getName())
print("Bird Group:",a.group)

-- Inheritance 
print("Inheritance Class")

-- first way
Audi1 = Car:new(nil,"Audi","black",4)
audi1 = Audi1:new{owner="James"}

function Audi1:getOwner ()
    return self.owner or ""
end

print("Owner",audi1:getOwner())

-- second way
Audi2 = Car:new()
function Audi2:new (tb,brand,color,wheels,owner)
    tb = tb or Car:new(tb,brand,color,wheels)
    setmetatable(tb, self)
    self.__index = self
    self.owner = owner
    return tb
end

function Audi2:getOwner ()
    return self.owner or ""
end

audi2 = Audi2:new(nil,"Audi","black",4,"Alice")
print("Owner",audi2:getOwner())

-- Multiple Inheritance
print("Multiple Inheritance Class")

local A   = {}
local B   = {}
local C   = {}
local Child = {}

function A:method1()
    print "This is belong to A"
end

function B:method2()
    print "This is belong to B"
end

function C:method3()
    print "This is belong to C"
end

local parents  = { A, B, C }
local rawset   = rawset
local cache_mt = {}
function cache_mt:__index(key)
  for i = 1, #parents do
    local parent = parents[i]
    local value = parent[key]
    if value ~= nil then
      rawset(self, key, value)
      return value
    end
  end
end

local cache = setmetatable({}, cache_mt)
setmetatable(Child, { __index = cache })

Child:method1()
Child:method2()
Child:method3()

-- Privacy
print("Privacy Class")

function newPrivacy(owner)
    local self = {owner = owner}

    local public_m1 = function ()
        print("Public Function 1")
    end

    local public_m2 = function ()
        print("Public Function 2")
    end

    local private_m1 = function ()
        print("private Function 1")
    end

    return {
        p1 = public_m1,
        p2 = public_m2
    }
end

local p = newPrivacy("NoOnwer")
p.p1() -- can not invoke private_m1

-- Single-Method Approach
print("Single-Method Approach Class")

function newCar (owner)
    return function (action, value)
        if action == "get" then return owner
        elseif action == "set" then owner = value
        else error("invalid action")
        end
    end
end

local car = newCar("Frank")
print("Owner",car("get"))
car("set","Bob")
print("Owner",car("get"))

-- dual representation
print("Dual Representation Class")
local price = {}
local Car = {}

function Car:increasePrice(value)
    price[self] =  price[self] + value
end

function Car:decreasePrice(value)
    price[self] =  price[self] - value
end

function Car:price()
    return price[self]
end

function Car:new (o)
    o = o or {} 
    setmetatable(o, self)
    self.__index = self
    price[o] = 1000
    return o
end

local c = Car:new()
c:increasePrice(100)
print("Price",c:price())