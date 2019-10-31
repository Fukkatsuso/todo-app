FROM ruby:2.6.5

RUN mkdir /app
COPY main.rb /app
COPY Gemfile /app
WORKDIR /app

RUN gem install bundler && \
  bundle install --path vendor/bundle

EXPOSE 8080

CMD ["bundle", "exec", "ruby", "main.rb"]