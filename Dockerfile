FROM python:3.7-alpine

ENV http_proxy "http://git-proxy:8080/"
ENV https_proxy "https://git-proxy:8080/"

RUN sudo pip install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]