# used to build images which are deployed to production
FROM ruby:3.1.2

# Install apt based dependencies required to run Rails as
# well as RubyGems. As the Ruby image itself is based on a
# Debian image, we use apt-get to install those.
RUN apt-get update && apt-get install -y build-essential nano netcat

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
RUN mkdir -p /planradar-assessment
WORKDIR /planradar-assessment

# Copy the Gemfile & Gemfile.lock and install the RubyGems.
# This is a separate step so the dependencies will be cached
# unless changes to one of those two files are made.
COPY Gemfile Gemfile.lock ./
# Doc: https://bundler.io/v2.3/man/bundle-install.1.html
RUN bundle install

# Copy the main application.
COPY . ./

ENV EDITOR=nano

# Configure an entry point, so we don't need to specify
# "bundle exec" for each of our commands.
ENTRYPOINT ["bundle", "exec"]

# build with
# docker build -t planradar-assessment .