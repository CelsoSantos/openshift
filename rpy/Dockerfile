FROM rpy2/rpy2:latest

ENV http_proxy "http://10.195.3.151:8080"
ENV https_proxy "http://10.195.3.151:8080"

RUN apt-get update -y && \
    apt-get install -y python-pip

RUN R -e "options(repos = list(CRAN = 'https://cran.microsoft.com/snapshot/2019-01-06')); install.packages('magrittr')" 
RUN R -e "options(repos = list(CRAN = 'https://cran.microsoft.com/snapshot/2019-01-06')); install.packages('HDtweedie')" 
RUN R -e "options(repos = list(CRAN = 'https://cran.microsoft.com/snapshot/2019-01-06')); install.packages('glmnet')" 

COPY ./requirements.txt /app/requirements.txt
 
RUN pip --trusted-host=pypi.python.org --trusted-host=pypi.org --trusted-host=files.pythonhosted.org install -r /app/requirements.txt --proxy="http://wthproxy:8080"

COPY . /app

ENTRYPOINT [ "python3" ]

CMD [ "/app/app_py.py" ]