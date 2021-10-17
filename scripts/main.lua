-- 初始化脚本搜索路径以及全局工具函数
package.path=package.path..";..\\scripts\\?.lua;"
require "utility.class"
require "utility.copy"

local Rectangle = require("rectangle")
local Circle = require("circle")

local rect1=Rectangle(3,4)
local rect2=Rectangle(1,2)
print("class name of rect1:"..rect1.__class.__name)
rect1:print_hello()

print("Area of rect1:"..tostring(rect1:area()))
print("Area of rect2:"..tostring(rect2:area()))

local circle=Circle(2)
print("class name of circle:"..circle.__class.__name)
print("Area of circle:"..tostring(circle:area()))
circle:print_hello()

print("Loading custom lib")
core.print_welcome()
-- print(test_lib)
-- test_lib.print_welcome()
print("End of main.lua")
