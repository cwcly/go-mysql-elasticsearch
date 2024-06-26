FROM golang:alpine

MAINTAINER siddontang

RUN apk add --no-cache tini mariadb-client

ADD . /go/src/go-mysql-es

RUN apk add --no-cache mariadb-client
RUN cd /go/src/go-mysql-es/ && \
    go build -o bin/go-mysql-elasticsearch ./cmd/go-mysql-elasticsearch && \
    cp -f ./bin/go-mysql-elasticsearch /go/bin/go-mysql-elasticsearch

ENTRYPOINT ["/sbin/tini","--","go-mysql-elasticsearch"]
