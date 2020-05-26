FROM centos/s2i-base-centos7

#ENV http_proxy "http://git-proxy:8080"
#ENV https_proxy "http://git-proxy:8080"


RUN yum install -y epel-release && \
  yum install -y R v8314-v8-devel gdal-devel proj-devel proj-nad proj-epsg python-pip && \
  yum clean all && \
  rm -rf /var/cache/yum

RUN chown -R 1001:1001 /opt/app-root && \
  chown -R 1001:1001 /usr/lib64/R/library && \
  chown -R 1001:1001 

USER 1001

RUN pip --trusted-host=pypi.python.org --trusted-host=pypi.org --trusted-host=files.pythonhosted.org install -r requirements.txt 
#--proxy="http://git-proxy:8080"

RUN R -e "options(repos = list(CRAN = 'https://cran.microsoft.com/snapshot/2019-01-06')); install.packages('magrittr')" 
RUN R -e "options(repos = list(CRAN = 'https://cran.microsoft.com/snapshot/2019-01-06')); install.packages('HDtweedie')" 
RUN R -e "options(repos = list(CRAN = 'https://cran.microsoft.com/snapshot/2019-01-06')); install.packages('glmnet')" 

COPY . /app

ENTRYPOINT [ "python3" ]

CMD [ "/app/app.py" ]