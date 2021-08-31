FROM python:2.7-slim-buster

MAINTAINER Solera Advisors "technicollins.business@gmail.com"

ENV APP_HOME /application
ENV C_FORCE_ROOT=true
ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH /usr/local/lib/python2.7/site-packages

# install dependencies
ADD ./requirements.txt .
RUN pip install -r requirements.txt
RUN rm requirements.txt

RUN apt-get update && apt-get install -y wget make

# INSTALL WEBKIT
RUN cd $PYTHONPATH && \
    wget https://files.pythonhosted.org/packages/4c/1b/6ba0653b5a348f4f9c72f57e253c57cf3d8e08c6313fd872853b4aa1b45c/Webware-for-Python-1.1.3.tar.gz && \
    tar xzvf Webware-for-Python-1.1.3.tar.gz && \
    rm Webware-for-Python-1.1.3.tar.gz && \
    cd Webware-1.1.3 && \
    python install.py --no-password-prompt --set-password=$WEBKIT_PASSWORD


RUN mkdir -p $APP_HOME

# Create a working directory for WebKit
RUN cd $PYTHONPATH/Webware-1.1.3 && python bin/MakeAppWorkDir.py -c Context -l lib --gitignore $APP_HOME/WebKit

# INSTALL AND CONFIGURE APACHE
RUN apt-get update && apt-get install -y apache2 apache2-dev


# INSTALL MOD_WEBKIT
# copy apxs to the correct folder
RUN cp /usr/bin/apxs /usr/sbin/apxs
# install
RUN cd $PYTHONPATH/Webware-1.1.3/WebKit/Adapters/mod_webkit2 && make && make install

COPY ./apache/httpd2.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 8080 8086

CMD $APP_HOME/WebKit/AppServer

# Start Apache Server
# CMD apache2ctl -DFOREGROUND
