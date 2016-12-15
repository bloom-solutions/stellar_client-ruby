FROM golang:latest

RUN apt-get update -qq
RUN apt-get upgrade -y
RUN apt-get install -y build-essential libpq-dev nodejs postgresql-client

RUN mkdir -p /app
WORKDIR /app

RUN curl -S -L -O https://github.com/stellar/bridge-server/releases/download/v0.0.14/bridge-v0.0.14-linux-amd64.tar.gz && \
  tar zxf bridge-v0.0.14-linux-amd64.tar.gz && \
  mv bridge-v0.0.14-linux-amd64 /bridge
RUN ln -ns /app/config_bridge.toml /bridge/config_bridge.toml

ADD . /app
