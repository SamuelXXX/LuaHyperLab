local Shape = require("shape")
local Rectangle = class(Shape, "Rectangle", nil) 

function Rectangle:__ctor(length,width)
    self.length=length
    self.width=width
end

function Rectangle:print_hello()
    super(Rectangle, self).print_hello()
    print("Hello, i am class-Rectangle")
end

function Rectangle:area()
    return self.length * self.width
end

return Rectangle