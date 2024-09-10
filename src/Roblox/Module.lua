local CommandModule = {}
local url = "http://127.0.0.1:8000/command" -- or your server url
local Commands = {}
local Cache = {}

function CommandModule:AddCommand(commandName, func)
    Commands[commandName] = func
end

function CommandModule:CompleteString(arguments)
    local result = ""
    for i = 2, #arguments do
        result = result .. (i == 2 and "" or " ") .. arguments[i]
    end
    return result
end

local function fetchCommand()
    local success, response = pcall(function()
        return game:HttpGet(url)
    end)

    if success then
        local commandData = game:GetService("HttpService"):JSONDecode(response)
        local command = commandData.command

        if not command or command == "" then
            return
        end

        local arguments = string.split(command, " ")

        if Commands[arguments[1]] and Cache["Command"] ~= command then
            Commands[arguments[1]](arguments)
            Cache["Command"] = command
        end
    else
        warn("Failed to fetch command:", response)
    end
end

function CommandModule:Start()
    while wait(1) do
        fetchCommand()
    end
end

return CommandModule
