-- Type
print(type("Hello world"))  --> string
print(type(3))              --> number
print(type(3.33))           --> number
print(type(print))          --> function
print(type(type))           --> function
print(type(true))           --> boolean
print(type(nil))            --> nil

-- nil
print(nil)

-- number
print(1, 1.11)

-- boolean
tr = true
fa = false
print(tr,fa)

-- string
print(string.upper("Hello,world"))
print(string.lower("HELLO"))
print(string.gsub("Hello,world",'l','L',3))
print(string.find("Hello,world",'ll',1))
print(string.reverse("Hello,world"))
print(string.format("Name is: %s", "James"))
print(string.char(98,99,100))
print(string.byte("bcd",2))
print(string.len("Hello,world"))
print(string.rep("H",10))
print("hello".." world")

for word in string.gmatch("Hello,world", "%a+") do 
	print(word)
end
print(string.match("This is a 1 word question.", "%d+ %a+"))
print(string.sub("Hello,world" ,5,-1))

-- Tables
local days = {"Monday", "Tuesday", "Wednesday","Thursday", "Friday", "Saturday", "Sunday"}
print(table.concat(days))
print(table.concat(days," "))
print(table.concat(days," ",2,3))
print("table days len",#days)
print("table days max index",table.maxn(days))

table.remove(days, 1)
print("table first element",days[1])

local car1 = {
    serial = 3,
	brand = "Porsche",
	color = "Black",
	wheels = {number=4, width=18 , brand="A"}
}

local car2 = {
    serial = 1,
	brand = "Lamborghini",
	color = "Red",
	wheels = {number=4, width=18 , brand="B"}
}

local car3 = {
    serial = 2,
	brand = "Ferrari",
	color = "White",
	wheels = {number=4, width=18 , brand="C"}
}

local cars = {}
table.insert(cars,1,car1)
table.insert(cars,2,car2)
table.insert(cars,3,car3)

for idx,car in ipairs(cars) do 
	print(idx,car.serial, car.brand)
end

local maxn = function(car1, car2)
    if (car1.serial > car2.serial) then
       result = car1;
    else
       result = car2;
    end

    return result; 
 end

table.sort(cars, maxn)

for idx,car in ipairs(cars) do 
	print(idx,car.serial, car.brand)
end

