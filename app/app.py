import logging
import os

from flask import Flask
import redis

app = Flask(__name__)

redis_host = os.environ.get('REDISHOST', 'localhost')
replica_redis_host = os.environ.get('READ_1_REDISHOST', 'localhost')
redis_port = int(os.environ.get('REDISPORT', 6379))
redis_client = redis.StrictRedis(host=redis_host, port=redis_port)
replica_redis_client = redis.StrictRedis(host=replica_redis_host, port=redis_port)

@app.route('/')
def index():
    value = redis_client.incr('counter', 1)
    return 'Visitor number: {}'.format(value)

@app.route('/read-replica')
def replica_index():
    value = replica_redis_client.get('counter')
    return 'Visitor number: {}'.format(value)


@app.errorhandler(500)
def server_error(e):
    logging.exception('An error occurred during a request.')
    return """
    An internal error occurred: <pre>{}</pre>
    See logs for full stacktrace.
    """.format(e), 500


if __name__ == '__main__':
    # This is used when running locally. Gunicorn is used to run the
    # application on Google App Engine and Cloud Run.
    # See entrypoint in app.yaml or Dockerfile.
    app.run(host='127.0.0.1', port=8080, debug=True)