

-- Iterators and Closures
print("Iterators and Closures")
function list_iter (t)
    local i = 0
    return function ()
        i = i + 1
        return t[i] 
    end
  end


-- create the iterator
local iter = list_iter({10, 20, 30}) 
while true do
    -- calls the iterator
    local element = iter()  
    if element == nil then break end
    print(element)
end

for element in list_iter({10, 20, 30}) do
  print(element)
end

-- The Semantics of the Generic for
--[[
    for <var-list> in <exp-list> do
        <body>
    end
]]
print("The Semantics of the Generic for")
local function iter(items,idx)
    idx = idx + 1
    local v = items[idx]
    if v then return idx,v else return nil,nil end
end

local function myIpair(items)
    return iter, items, 0
end

for k,v in myIpair({7,8,9}) do
    print(k,v)
end

-- Stateless Iterators(Two params)
print("Stateless Iterators")
function square(state,n) 
    if n<state then n=n+1 
        return n, n*n 
    end 
end

for i,n in square,3,0 do 
    print(i,n) 
end

-- Stateful Iterators(Use Closures)
print("Stateful Iterators")
local language = {"Python", "Golang", "Rust"}

function arrayIter (items)
   local idx = 0
   local length = #items
   return function ()
    idx = idx + 1
      if idx <= length
      then
         return items[idx]
      end
   end
end

for element in arrayIter(language)
do
   print(element)
end

-- Iterators with Complex State
print("Iterators with Complex State")


