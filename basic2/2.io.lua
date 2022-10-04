-- w: write
-- w+: update and clear all old data
local file, err = io.open("./files/text1.txt","w+")
if err == nil then
	for i,v in ipairs({"Cat","Bird", "Tiger"}) do 
		file:write(tostring(i).."<-->"..v.."\n")
	end
	file:close()
end

-- a: append
-- a+: append on the tail
local file, err = io.open("./files/text1.txt","a+")
if err == nil then
	for i,v in ipairs({"Rust","Python", "Golang"}) do 
		file:write(tostring(i).."<-->"..v.."\n")
	end
	file:close()
end

-- r: read
-- r+: update, keep old data
local file,err = io.open("./files/text1.txt","r+")
if err == nil then
	print(io.type(file))
	for line in file:lines() do 
		print(line)
	end
	file:close()
	print(io.type(file))
end

-- createFile
local createFile = function()
	local ret = os.execute();
	if ret ~= 0 then
		os.execute("cd . > temp.txt")
	else
		print("Shell is not available, ret = "..ret.."\n")
	end
end

createFile()

function inputOutput()
	io.output("./files/text2.txt")
	io.write("Hello1\n")
	io.write("Hello2\n")
	io.write("Hello3\n")
	io.close()

	io.input("./files/text2.txt")
	print(io.read("*a"))
	if io.type(file) == "file" then io.close() end
end

inputOutput()












