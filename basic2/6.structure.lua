-- array
print("\nArray")
array = {"Python", "Lua", "Java"}
for i= 1, #array do
   print(array[i])
end

-- two-dimensional array
array = {}
for i=1,3 do
   array[i] = {}
      for j=1,3 do
         array[i][j] = i*j
      end
end

for i=1,3 do
   for j=1,3 do
      print(array[i][j])
   end
end

-- Linked Lists
print("\nLinked Lists")
local list = nil
list = {next = list, value = "10"}
list = {next = list, value = "20"}
list = {next = list, value = "30"}
list = {next = list, value = "40"}
list = {next = list, value = "50"}
list = {next = list, value = "60"}

local firstit = list
while firstit do
    print(firstit.value)
    firstit = firstit.next
end

-- Queues and Double Queues
print("\nQueues and Double Queues")

List = {}
function List.new ()
    return {first = 0, last = -1}
end
   
function List.pushleft (list, value)
    local first = list.first - 1
    list.first = first
    list[first] = value
end
  
function List.pushright (list, value)
    local last = list.last + 1
    list.last = last
    list[last] = value
end

function List.popleft (list)
    local first = list.first
    if first > list.last then error("list is empty") end
    local value = list[first]
    list[first] = nil        
    list.first = first + 1
    return value
end

function List.popright (list)
    local last = list.last
    if list.first > last then error("list is empty") end
    local value = list[last]
    list[last] = nil        
    list.last = last - 1
    return value
end

function List.show (list)
    for idx in pairs(list) do
        if not (idx == "first" or idx == "last") then 
            print(idx,list[idx])
        end
    end
end

list = List.new()
List.pushleft(list,10)
List.pushleft(list,20)
List.pushleft(list,30)
List.pushright(list,40)
List.pushright(list,50)
List.pushright(list,60)
List.show(list)

-- Reverse Tables
print("\nReverse Tables")
strings = {"1", "2", "3", "4","5", "6"}
revStrings = {}
for i=#strings, 1, -1 do
	revStrings[#revStrings+1] = strings[i]
end
for k,v in ipairs(revStrings) do
    print(v)
end

-- Set
print("\n Set")

function mySet(list)
    local set = {}
    local res = {}
    for _, v in ipairs(list) do 
        set[v] = true
    end

    for k in pairs(set) do
        table.insert(res,k)
    end
    return res
end

local myset = mySet({"AAA","AAA","BBB","BBB"})
for idx,item in ipairs(myset) do
    print(idx,item)
end

-- String Buffers
print("\n String Buffers")

function newBuffer ()
    return {""} 
end
  
function addString (buffer, s)
    table.insert(buffer, s)   
    for i= #buffer-1, 1, -1 do
        if string.len(buffer[i]) > string.len(buffer[i+1]) then
            break
        end
        buffer[i] = buffer[i] .. table.remove(buffer)
    end
end

local s = newBuffer()
for line in io.lines("./files/text2.txt") do
    addString(s, line .. "\n")
end
s = table.concat(s, "\n")
print(s)

-- Graphs
--[[
    local graph_1 = adjacency_array {
        a = {'b'},
        b = {'a', 'c'},
        c = {'a'},
    }
    
    local graph_2 = edges_array {
        {'a', 'b'},
        {'b', 'a'},
        {'b', 'c'},
        {'c', 'a'},
    }
    
    local graph_2 = adjacency_matrix {
        {0, 1, 0},
        {1, 0, 1},
        {1, 0, 0},
    }
]]





