FROM python:3.9-slim

ENV PATH /env/bin:$PATH

ENV REDISHOST 127.0.0.1
ENV REDISPORT 6379

ADD requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

ADD . /app

CMD ["python", "/app/app.py", "run", "0.0.0.0"]
