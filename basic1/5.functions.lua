--[[
	optional_function_scope function function_name( argument1, argument2, argument3..., argumentn)
		function_body
		return result_params_comma_separated
	end
--]]

-- Multiple Results
function totalAvg(x,y)
	local total = x+y
	local avg = total/2
	return total,avg
end

total,avg=totalAvg(5,6)
print(total,avg)

-- Variable Number of Arguments
function vaparams(...)
	local args = {...}
	local strings = table.concat(args,"")
	print(strings)
end
vaparams(1,2,3)
vaparams(1,2,3,4,5)

-- Value Arguments
function swap(x,y)
	x,y=y,x
	print("Swap in function: ", x, y)
end

local x,y = 1,2
print("Swap Before: ", x, y)
swap(x,y)
print("Swap After: ", x, y)


-- Reference Arguments
function double(arg)
	arg.width = arg.width*2
	arg.length = arg.length*2
end
local ractangle = {width=10,length=15}
print("Ractangle before:",ractangle.width,ractangle.length)
double(ractangle)
print("Ractangle after: ", ractangle.width,ractangle.length)

-- Closures and anonymous function
function counterMaker()
    local i = 0
    return function () -- anonymous function
       i = i + 1
          return i
       end
    end

counter = counterMaker()
print(counter())
print(counter())
print(counter())

-- Non-Global Functions (Function as Variable)
local add = function(x,y)
	return x + y
end

local subrt = function(x,y)
	return x - y
end

local function opti(x,y,func)
	return func(x,y)
end

print(opti(1,2,add))
print(opti(6,5,subrt))

-- Proper Tail Calls
--[[
   -- stack overflow, not tail call
   
   local function fact(n)
        if n == 1 then
            return 1
        else
            return n * fact(n-1)
        end
    end 
    print(fact(1000000))
]]

-- proper tail recursion
local function sum(n)
    return sum_iter(n, 1)
end

function sum_iter(n, now)
    if n <= 1 then
        return now
    else
        return sum_iter(n-1, now + n)
    end
end

print(sum(100000))