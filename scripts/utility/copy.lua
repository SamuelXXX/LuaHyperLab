-- Tools functions
function deepcopy(data)
    local copy
    if type(data) == "table" then
        copy = {}
        for k, v in pairs(data) do
            copy[deepcopy(k)] = deepcopy(v)
        end
        setmetatable(copy, deepcopy(getmetatable(data)))
    else
        copy = data
    end
    return copy
end

function shallowcopy(data)
    local copy
    if type(data) == "table" then
        copy = {}
        for k, v in pairs(data) do
            copy[k] = v
        end
        setmetatable(copy, deepcopy(getmetatable(data)))
    else
        copy = data
    end
    return copy
end

