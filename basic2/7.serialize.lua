
-- serialize table without cycles
function tablePrint1 (tb,ident)
    local indent = ident or 0
    if type(tb) == "table" then
        for key, value in pairs (tb) do
            io.write(string.rep (" ", indent)) 
            if type (value) == "table" then
                io.write(string.format("%s:\n", tostring (key)));
                io.write(string.rep (" ", indent+4)) 
                io.write("{\n");
                tablePrint1 (value, indent + 8)
                io.write(string.rep (" ", indent+4)) 
                io.write("}\n");
            else
                io.write(string.format("%s:%s;\n", tostring (key), tostring(value)))
            end
        end
    else
        io.write(tb .. "\n")
    end
end

-- serialize table with cycles
function tablePrint2 (tb,ident,done)
    done = done or {}
    local indent = ident or 0
    if type(tb) == "table" then
        for key, value in pairs (tb) do
            io.write(string.rep (" ", indent)) 
            if type (value) == "table" and not done[value] then
                done[value] = true
                io.write(string.format("%s:\n", tostring (key)));
                io.write(string.rep (" ", indent+4)) 
                io.write("{\n");
                tablePrint2 (value, indent + 8)
                io.write(string.rep (" ", indent+4)) 
                io.write("}\n");
            else
                io.write(string.format("%s:%s;\n", tostring (key), tostring(value)))
            end
        end
    else
        io.write(tb .. "\n")
    end
end


tb = {
    name="James",
    age =11,
    address={
        country="AAA",
        state = "BBB",
        city = {
            street = "aaa",
            community = "bbb",
            floor = "ccc"
        }
    }
}

tablePrint1(tb)
tablePrint2(tb)


