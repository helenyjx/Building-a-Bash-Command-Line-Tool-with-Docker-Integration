# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.245.2/containers/codespaces-linux/.devcontainer/base.Dockerfile

FROM mcr.microsoft.com/vscode/devcontainers/universal:2-focal
FROM alpine:latest
RUN apk update && apk add bash

WORKDIR /app
COPY read.sh /app
COPY Walmart.csv /app
COPY clean.sh /app
COPY sort.sh /app
