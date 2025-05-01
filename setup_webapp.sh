#!/bin/bash
sudo yum update -y
sudo yum install python3 -y
pip3 install flask
echo "from flask import Flask
app = Flask(__name__)
@app.route('/')
def home():
    return '<h1>My Python Web App</h1>'
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)" > app.py
nohup python3 app.py &
