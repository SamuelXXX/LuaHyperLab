local Shape = require "shape"
local Circle = class(Shape, "Circle", nil)

local PI = 3.1415926

function Circle:__ctor(radius)
    self.radius = radius
end

function Circle:area()
    return self.radius * self.radius * PI
end

function Circle:print_hello()
    print("i am a circle")
end

return Circle
