FROM ruby:2.5.1

#RUN bundle config --global frozen 1

WORKDIR /Users/nyurk/Desktop/repos/Ruby_examples/Cucumber

COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

RUN cucumber --init

CMD ["cucumber", "features"]
