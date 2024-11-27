# Dockerfile for rails api project

# Use the official Ruby image
FROM ruby:3.3.6-slim

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs vim git

WORKDIR /app

RUN gem install bundler

COPY Gemfile* ./

RUN bundle install

ADD . /app

EXPOSE ${DEFAULT_PORT}

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# TODO: set puma as the default server
CMD\
   ./bin/rails server -b 0.0.0.0 -p 3001 

