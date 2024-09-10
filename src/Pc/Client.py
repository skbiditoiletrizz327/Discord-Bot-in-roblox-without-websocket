import discord
import requests

## this is only a simple example

TOKEN = 'your_discord_bot_token'
SERVER_URL = 'http://127.0.0.1:8000/command' 

intents = discord.Intents.default()
intents.message_content = True 

client = discord.Client(intents=intents)

@client.event
async def on_ready():
    print(f'Logged in as {client.user}')
    requests.post(SERVER_URL, json={'command': ".say Loaded"}) ## please put a command here before launching

@client.event
async def on_message(message):
    if message.author == client.user:
        return

    response = requests.post(SERVER_URL, json={'command': message.content})
    
    if response.status_code == 200:
        embed = discord.Embed(
            title="Success!",
            description="Message successfully sent to the client",
            color=discord.Color.green() 
        )
        await message.channel.send(embed=embed)
    else:
        await message.channel.send('Failed to send command.')

client.run(TOKEN)