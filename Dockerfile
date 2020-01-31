FROM python:3.8.1-alpine
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir /code
WORKDIR /code

ADD requirements.txt /code/

RUN apk add --no-cache mariadb-connector-c-dev mysql-client;\
    apk add --no-cache --virtual .build-deps build-base mariadb-dev;\
    pip install -r requirements.txt;\
    apk del .build-deps

ADD . /code/
