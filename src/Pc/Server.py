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