FROM python:3.9.12-alpine

WORKDIR /usr/src

COPY ./vendor/python/requirements-lock.txt ./vendor/python/
RUN pip install -r ./vendor/python/requirements-lock.txt

