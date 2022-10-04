--[[
.  all characters
%a letters
%c control characters
%d digits
%g printable characters except spaces
%l lower-case letters
%p punctuation characters
%s space characters
%u upper-case letters
%w alphanumeric characters
%x hexadecimal digits

( ) . % + - * ? [ ] ^ $  -- magic characters for pattern match
+ 1 or more repetitions
* 0 or more repetitions
- 0 or more lazy repetitions
? optional (0 or 1 occurrence)
]]

-- pattern
print((string.gsub("Hello, James-Bonds!", "%A", "*")))
print(string.match("Today is 15/9/2020", "%d+/%d+/%d+"))


-- captures
d, m, y = string.match("Today is 15/9/2020", "(%d+)/(%d+)/(%d+)")
print(d, m, y)
print(string.match("James", "()ame()"))  -- captures its position in the subject string

-- replacements
name = "James"; age = "11"
print(string.gsub("Your name is $name and age is $age.", "$(%w+)", _G))
--  _G is a predefined table containing all global variables



