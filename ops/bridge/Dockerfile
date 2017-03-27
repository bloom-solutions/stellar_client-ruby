FROM golang:latest

RUN apt-get update -qq
RUN apt-get upgrade -y
RUN apt-get install -y build-essential libpq-dev nodejs postgresql-client

RUN mkdir -p /app
WORKDIR /app

ENV BRIDGE_VERSION=v0.0.15
RUN curl -S -L -O \
  https://github.com/stellar/bridge-server/releases/download/$BRIDGE_VERSION/bridge-$BRIDGE_VERSION-linux-amd64.tar.gz && \
  tar zxf bridge-$BRIDGE_VERSION-linux-amd64.tar.gz && \
  mv bridge-$BRIDGE_VERSION-linux-amd64 /bridge
RUN ln -ns /app/config_bridge.toml /bridge/config_bridge.toml

ADD . /app
