
-- if else
local num=10
if (num<=0) then
	print("value num less than zero")
elseif(num>=10) then
	print("value num large than ten")
else
	print("value num between 0 and 10")
end

-- while loop
num=0
while num < 5
do 
	print("value num is",num)
	num = num + 1
end

-- for loop
for num=1,10,2 do
	print("value num is ", num)
end

local nums = {1,2,3}  
for idx,value in ipairs(nums) do
	print(idx,value)
end

-- repeat until
num=0
repeat
	print("value num is",num)
	num = num+1
until(num>5)

-- break and return
local idx = 1
local nums = {1,3,5,7,9}
while nums[idx] do
    if nums[idx] == 5 then break end
    idx = idx + 1
    print(idx,nums[idx])
end

-- Local Variables and Blocks
x = 10
local i = 1        
while i<=x do
  local x = i*8  
  if x >= 30 then break end
  print("local x: ", x)  
  i = i + 1
end
print("global x: ", x)
