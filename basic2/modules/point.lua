local Point = {} -- the module

 local function new (x,y)
    return {x=x,y=y}
 end

 Point.new = new -- add 'new' to the module

 function Point.add (p1, p2)
    return new(p1.x + p2.x, p1.y + p2.y)
 end

 function Point.sub (p1, p2)
    return new(p1.x - p2.x, p1.y - p2.y)
 end

 function Point.mul (p1, p2)
    return new(p1.x*p2.x, p1.y*p2.y)
 end

function Point.distance (p1,p2)
    local res = math.sqrt((p1.x-p2.x)^2 + (p1.y-p2.y)^2)
    return res
 end

 function Point.tostring (p)
    return string.format("Point:(%g,%g)", p.x,p.y)
 end

 return Point
