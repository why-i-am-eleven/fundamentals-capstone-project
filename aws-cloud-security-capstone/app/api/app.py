from flask import Flask, jsonify

app = Flask(__name__)

@app.get("/")
def index():
    return jsonify({
        "service": "capstone-demo-api",
        "message": "Secure three-tier cloud migration sample",
        "status": "running"
    })

@app.get("/health")
def health():
    return jsonify({"status": "healthy"}), 200

if __name__ == "__main__":
    # Local development only. Use a production WSGI server behind a load balancer in deployment.
    app.run(host="127.0.0.1", port=5000, debug=False)
