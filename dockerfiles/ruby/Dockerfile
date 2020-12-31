FROM ruby:2.6.6-alpine

WORKDIR /usr/src

COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.1.4 && \
    bundle install --path=./vendor/ruby/gems

