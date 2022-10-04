-- Code refer to Programming in Lua

local Set = {}

 function Set.new (list)
    local set = {}
    if #list > 0 then 
        for _, v in ipairs(list) do 
            set[v] = true 
        end
    end
    return set
 end

 function Set.union (a, b)
    local res = Set.new({})
        for k in pairs(a) do res[k] = true end
        for k in pairs(b) do res[k] = true end
    return res
 end

 function Set.intersection (a, b)
    local res = Set.new({})
    for k in pairs(a) do
        res[k] = b[k]
    end
    return res
 end

 function Set.tostring (set)
    local l = {} 
    for e in pairs(set) do
        l[#l + 1] = tostring(e)
    end
    return "{" .. table.concat(l, ", ") .. "}"
 end

 return Set
