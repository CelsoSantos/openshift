FROM python:3.6

#ENV http_proxy "http://git-proxy:8080"
#ENV https_proxy "http://git-proxy:8080"

RUN sudo yum -y install R

RUN pip --trusted-host=pypi.python.org --trusted-host=pypi.org --trusted-host=files.pythonhosted.org install -r requirements.txt 
#--proxy="http://git-proxy:8080"

RUN R -e "options(repos = list(CRAN = 'https://cran.microsoft.com/snapshot/2019-01-06')); install.packages('magrittr')" 
RUN R -e "options(repos = list(CRAN = 'https://cran.microsoft.com/snapshot/2019-01-06')); install.packages('HDtweedie')" 
RUN R -e "options(repos = list(CRAN = 'https://cran.microsoft.com/snapshot/2019-01-06')); install.packages('glmnet')" 

COPY . /app

ENTRYPOINT [ "python3" ]

CMD [ "/app/app.py" ]
