# Dockerfile for rails api project

# Use the official Ruby image
FROM ruby:3.3.6-slim

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs vim git

WORKDIR /app

RUN gem install bundler

COPY Gemfile* ./

RUN bundle install

ADD . /app

ARG DEFAULT_PORT 3000

EXPOSE ${DEFAULT_PORT}

# TODO: set puma as the default server
CMD ["rails", "server", "-b", "0.0.0.0"]
