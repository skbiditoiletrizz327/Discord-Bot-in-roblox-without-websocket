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

### ❓ **How It Works:**

By setting up a **local server** using the **Flask** library, you enable communication between Discord and your Roblox client. The server acts as a **middleman** that receives commands from Discord and sends them to the Roblox client.

#### 1. **Flask Local Server:**
   - Flask creates a local web server running on your computer (localhost) that listens for HTTP requests. This allows both the Discord bot and the Roblox client to interact with it via **POST** and **GET** requests.
   
#### 2. **Receiving Commands (POST Request):**
   - When you type a command in Discord (e.g., `.say hi`), the Discord bot sends a **POST request** to the Flask server, containing the command in JSON format. 
   - Flask receives this command and stores it as `latest_command` in the server's memory. It then sends a response back to the Discord bot confirming the command was received successfully.

#### 3. **Retrieving Commands (GET Request):**
   - On the Roblox side, the game client makes periodic **GET requests** to the Flask server to check for any new commands. 
   - The Flask server responds with the latest command received from Discord, which the Roblox client then processes (e.g., displaying the message in the chat or making the character perform an action).


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
> 4. Once in the folder, open a command prompt and type in `pip install -r requirements.txt`. This will install the required packages. (Located in src/Pc)
> 5. Once the packages are installed, run the `Server.py`. (Located in src/Pc)
> 6. After initializing the server, run `Client.py`. (Located in src/Pc)
> 7. Join a Roblox game and inject with your executor of choice.
> 8. Then run the `client.lua` script and add your own commands to it. (Located in src/Roblox)

---

![Bot Demo](https://raw.githubusercontent.com/skbiditoiletrizz327/Discord-Bot-in-roblox-without-websocket/main/src/showcase.gif)

---
