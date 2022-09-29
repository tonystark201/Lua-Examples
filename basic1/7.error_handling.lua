-- Assert and Error Functions
function maxn(x,y)
    assert(type(x) == "number", "x is not a number")
    assert(type(y) == "number", "y is not a number")
    if x>=y then return x else return y end
 end
maxn(10,20)
 -- maxn(10,nil)

 -- pcall and xpcall
 if pcall(maxn,1,1) then
    print("Success")
 else
     print("Failure")
 end


 status = xpcall(
    maxn,
    1,
    nil,
    function(err) print("Error: ", err) end
 )
 print(status)

