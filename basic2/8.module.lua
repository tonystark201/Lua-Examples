local point = require "modules.point"

p1 = point.new(5,6)
p2 = point.new(8,9)

print(point.tostring(p1),point.tostring(p2))
print(point.distance(p1,p2))