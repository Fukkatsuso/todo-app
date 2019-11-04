FROM ruby:2.6.5

WORKDIR /app

COPY main.rb /app
COPY Gemfile /app

RUN gem install bundler && \
    bundle install --path vendor/bundle

EXPOSE 8080

CMD ["bundle", "exec", "ruby", "main.rb"]

# $ docker build -t todo-api-sinatra .