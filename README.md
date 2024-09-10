# **🎮 Discord Bot in Roblox (No WebSocket Required) 🤖**

[![Discord](https://img.shields.io/badge/Discord-Bot-7289da?logo=discord&logoColor=white)](https://discord.com)
[![Roblox](https://img.shields.io/badge/Roblox-Scripted-red?logo=roblox)](https://roblox.com)

---

## 🛠 **Execute Client-Side Commands in Roblox via Discord**

You can **integrate a Discord bot** into your Roblox instance, allowing you to interact with Discord from Roblox.

---

### 📋 **Features:**
- **Control Roblox client** through Discord commands.
- Simple, WebSocket-free setup.

---

### ✨ **How It Works:**

By opening a local server using the Flask library, it creates two methods of command exchange between Discord and the Roblox client.

---

🎯 **Command Structure:**

| Command  | Action                         |
|----------|---------------------------------|
| `.say`   | Sends a message to Roblox chat. |
| `.jump`  | Makes your Roblox character jump. |

---

> **🔧 Setup Guide:**  
> 
> 1. [Download Python](https://www.python.org/)
> 2. Once the Python installer is opened, click "add to path" and then install.
> 3. Download the necessary files as a ZIP and go into that folder.
> 4. Once in the folder, open a command prompt and type in `pip install -r requirements.txt`. This will install the required packages.
> 5. Once the packages are installed, run the `Server.py`.
> 6. After initializing the server, run `Client.py`.
> 7. Join a Roblox game and inject with your executor of choice.
> 8. Then run the `client.lua` script and add your own commands to it.

---

![Bot Demo](https://yourimageurl.com/demo.gif)

---
### 📜 **Requirements - `requirements.txt`:**

```txt
requests
flask
discord
```

### 📜 **Server Code (Flask) - `Server.py`:**

```python
from flask import Flask, request, jsonify

app = Flask(__name__)

latest_command = None

@app.route('/command', methods=['POST'])
def receive_command():
    global latest_command
    data = request.json
    latest_command = data.get('command')
    print(f"Received command: {latest_command}")
    return jsonify({"status": "success"}), 200

@app.route('/command', methods=['GET'])
def get_latest_command():
    global latest_command
    return jsonify({"command": latest_command}), 200

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8000)
```

### 📜 **Client Code Bot - `Client.py`:**

```py
import discord
import requests

TOKEN = 'your_discord_bot_token'
SERVER_URL = 'http://127.0.0.1:8000/command' 

intents = discord.Intents.default()
intents.message_content = True 

client = discord.Client(intents=intents)

@client.event
async def on_ready():
    print(f'Logged in as {client.user}')
    requests.post(SERVER_URL, json={'command': ".say Legion has been Loaded!"})

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
```
