FROM alpine:latest
RUN apk update && apk add bash

WORKDIR /app
COPY read.sh /app
COPY Walmart.csv /app
COPY clean.sh /app
COPY sort.sh /app