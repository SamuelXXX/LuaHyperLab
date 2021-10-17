require("utility.copy")

-- defined classes
local _defined_classes = {}

function get_defined_class(name)
    return _defined_classes[name]
end

function class(super, name, class_vars)
    if _defined_classes[name] ~= nil then
        print("[Class] Already defined class:" .. name .. ", class defination failed!!!")
        return nil
    end

    if type(super) == "string" then
        local nsuper = _defined_classes[super]
        if nsuper == nil then
            print("[Class] Target super class '" .. super .. "' does not exist!!!")
        end
        super = nsuper
    end

    local class_type = deepcopy(class_vars) or {}
    setmetatable(class_type, {
        __index = super,
        __call = function(mytable, ...)
            obj = {}
            setmetatable(obj, {
                __index = mytable
            })
            obj.__class = mytable
            if mytable.__ctor ~= nil then
                mytable.__ctor(obj, ...)
            end
            return obj
        end
    })

    class_type.__base = super
    class_type.__name = name
    _defined_classes[name] = class_type

    return class_type
end

function super(class, instance)
    local func_executor = {}
    local super_class = class.__base
    if super_class == nil then
        print("[Class] super class does not exist!!!")
        return
    end

    setmetatable(func_executor, {
        __index = function(self, key)
            func = super_class[key]
            if type(func) ~= "function" then
                return nil
            end

            local function func_wrapper(self,...) 
                super_class[key](instance,...)
            end
            return func_wrapper
        end
    })

    return func_executor
end

