# app.py
from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def root():
    return jsonify(message="Hello from Flask on Kubernetes!")

@app.route("/health")
def health():
    return jsonify(status="ok")

if __name__ == "__main__":
    # match Docker exposure: bind to 0.0.0.0 so container is reachable
    app.run(host="0.0.0.0", port=5000)
