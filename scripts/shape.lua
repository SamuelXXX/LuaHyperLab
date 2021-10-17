local Shape = class(nil,"Shape",nil)

function Shape:area()
    return 0
end

function Shape:print_hello()
    print("Hello, i am class-Shape")
end

return Shape