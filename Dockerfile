FROM python:3.7-alpine

ENV http_proxy "http://git-proxy:8080/"
ENV https_proxy "https://git-proxy:8080/"

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org -r requirements.txt

COPY . /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]