from flask import Flask
from redis import Redis, RedisError
import os
import socket

# Conectar a un Redis
redis = Redis()

app = Flask(__name__)

@app.route("/")
def hello():
    try:
        visits = redis.incr("counter")
    except RedisError:
        visits = "<i>cannot connect to Redis, counter disabled</i>"

    html = "<h3>Felicidades {name}!</h3>" \
           "<b>Hostname:</b> {hostname}<br/>" \
           "<b>Visitas:</b> {visits}"
    return html.format(name=os.getenv("NAME", "Desconocido"), hostname=socket.gethostname(), visits=visits)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80)