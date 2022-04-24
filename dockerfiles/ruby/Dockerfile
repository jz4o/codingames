FROM ruby:3.1.2-alpine

WORKDIR /usr/src

COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.2.27 && \
    bundle config set --local path './vendor/ruby/gems' && \
    bundle install

