FROM ruby:3.1.2

COPY . ./
RUN bundle
ENTRYPOINT ["bundle", "exec", "rackup", "-p", "4567", "-o", "0.0.0.0"]