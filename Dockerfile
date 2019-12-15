FROM python:2.7-alpine3.7
EXPOSE 3000

ADD . /app

WORKDIR /app

COPY requirements.txt /app

RUN pip install -r requirements.txt

COPY app.py /app
CMD [ "python", "app.py" ]