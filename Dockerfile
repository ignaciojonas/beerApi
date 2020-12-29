FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN gem install bundler:2.2.1
RUN mkdir /beerApi
WORKDIR /beerApi
COPY Gemfile Gemfile.lock /beerApi/
RUN bundle install --jobs 2
COPY . /beerApi

# Add a script to be executed every time the container starts.
COPY docker/* /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]