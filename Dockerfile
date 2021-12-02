FROM ubuntu

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt update
RUN apt -y install python3
RUN ln /usr/bin/python3 /usr/bin/python
RUN apt -y install python3-pip
RUN ln /usr/bin/pip3 /usr/bin/pip
RUN pip install --upgrade pip
ADD ./requirements.txt /app/
RUN pip install -r /app/requirements.txt

ENV DJANGO_SETTINGS_MODULE=sampleBackend.settings

#dev
EXPOSE 8000

#docker-compose build
#docker-compose up
#docker exec -it sampleBackend /bin/bash
