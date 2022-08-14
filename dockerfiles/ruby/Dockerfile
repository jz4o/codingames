FROM ruby:3.1.2-alpine

WORKDIR /usr/src

RUN apk upgrade && \
    apk update && \
    apk add --no-cache \
    gcc \
    libc-dev \
    make

COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.3.12 && \
    bundle config set --local path './vendor/ruby/gems' && \
    bundle install

