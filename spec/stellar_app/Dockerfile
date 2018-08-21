FROM ruby:2.5.1

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  curl -sL https://deb.nodesource.com/setup_8.x | bash && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -yqq && \
    apt-get install -yqq --no-install-recommends nodejs yarn && \
    ln -nfs /usr/lib/x86_64-linux-gnu/libssl.so.1.0.2 /usr/lib/x86_64-linux-gnu/libssl.so

ENV APP=/app
RUN mkdir $APP

WORKDIR $APP

ENV BUNDLE_GEMFILE=$APP/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle \
  PATH=./bin:$PATH

RUN mkdir $BUNDLE_PATH
