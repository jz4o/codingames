FROM python:3.11.5-alpine

WORKDIR /usr/src

COPY ./vendor/python/requirements-lock.txt ./
RUN pip install -r ./requirements-lock.txt

RUN pip list --outdated | tail -n +3 | awk '{print $1}' | xargs pip install --upgrade

