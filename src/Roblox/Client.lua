local CommandModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/skbiditoiletrizz327/Discord-Bot-in-roblox-without-websocket/main/src/Roblox/Module.lua"))() -- or your own url if you want

CommandModule:AddCommand(".hi", function(arguments)
    print("Hello, world!")
end)
CommandModule:AddCommand(".say", function(arguments)
    local message = CommandModule:CompleteString(arguments)
     game.ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(message, "All") -- only works on old message system
end)

CommandModule:Start()
