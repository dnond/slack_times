FROM ruby:2.3.1
ENV SLACK_TOKEN ${SLACK_TOKEN}
ENV SLACK_TIMES_CHANNEL ${SLACK_TIMES_CHANNEL}

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV RUBYOPT "-KU -E utf-8:utf-8"

RUN mkdir -p /var/home/slack_times
WORKDIR /var/home/slack_times

ADD Gemfile Gemfile
ADD slack_times.gemspec slack_times.gemspec
ADD Gemfile.lock Gemfile.lock

RUN git init
RUN bundle install -j4

ADD . /var/home/slack_times

ENTRYPOINT /var/home/slack_times/bin/slack_times

