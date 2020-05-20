FROM python:3.7-alpine

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt --proxy="http://wthproxy:8080"

COPY . /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
