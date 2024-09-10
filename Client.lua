local CommandModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/skbiditoiletrizz327/Discord-Bot-in-roblox-without-websocket/main/Module.lua"))()

CommandModule:AddCommand(".hi", function(arguments)
    print("Hello, world!")
end)

CommandModule:Start()
