local CommandModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/skbiditoiletrizz327/Discord-Bot-in-roblox-without-websocket/main/src/Roblox/Module.lua"))()

CommandModule:AddCommand(".hi", function(arguments)
    print("Hello, world!")
end)
CommandModule:AddCommand(".say", function(arguments)
    local message = CommandModule:CompleteString(arguments)
    CommandModule:BroadcastMessage(message)
end)

CommandModule:Start()
