FROM ubuntu

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update
RUN apt install -y apt-utils vim curl apache2 apache2-utils wget
RUN apt -y install python3 libapache2-mod-wsgi-py3 libmysqlclient-dev
RUN ln /usr/bin/python3 /usr/bin/python
RUN apt-get -y install python3-pip
RUN ln /usr/bin/pip3 /usr/bin/pip
RUN pip install --upgrade pip
ADD ./requirements.txt /app/
RUN pip install -r /app/requirements.txt
ADD ./demo_site.conf /etc/apache2/sites-available/000-default.conf

ENV DJANGO_SETTINGS_MODULE=diagnossBackend.settings

#dev
EXPOSE 8000

#docker-compose build
#docker-compose up
#docker exec -it diagnossBackend /bin/bash
