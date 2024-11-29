# Dockerfile for rails api project

# Use the official Ruby image
FROM ruby:3.3.6-slim

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs vim git

WORKDIR /app

RUN gem install bundler

COPY Gemfile* ./

EXPOSE ${DEFAULT_PORT}

# TODO: set puma as the default server
CMD\
   bundle install && \
   rm -f /app/tmp/pids/server.pid && \
   ./bin/rails server -b 0.0.0.0 -p 3001 \