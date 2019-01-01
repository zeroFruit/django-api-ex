FROM python:3.7.1-alpine
MAINTAINER zerofruit

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# create user only for running this application
# not creating home directory, this only simply to
# run our process for project
RUN adduser -D user
USER user
