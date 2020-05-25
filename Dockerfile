FROM python:3.7-alpine

ENV http_proxy "http://git-proxy:8080/"
ENV https_proxy "https://git-proxy:8080/"
ENV HTTP_PROXY "http://git-proxy:8080/"
ENV HTTP_PROXY "https://git-proxy:8080/"

RUN pip --trusted-host=pypi.python.org --trusted-host=pypi.org --trusted-host=files.pythonhosted.org install -r requirements.txt --proxy="http://git-proxy:8080"

COPY . /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]