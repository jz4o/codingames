FROM python:3.9.12-alpine

WORKDIR /usr/src

COPY ./vendor/python/requirements-lock.txt ./
RUN pip install -r ./requirements-lock.txt

