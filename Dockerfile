FROM alpine:3.24.4@sha256:93b41ef40b1677fce8fcc64ff4af09daddfacf5040afde618bc46c1e2d1cc7d4

RUN apk add --no-cache go jq wget git

RUN wget https://github.com/cli/cli/releases/download/v2.31.0/gh_2.31.0_linux_amd64.tar.gz \
  && tar xvf gh_2.31.0_linux_amd64.tar.gz gh_2.31.0_linux_amd64/bin/gh \
  && mv gh_2.31.0_linux_amd64/bin/gh /usr/local/bin

RUN go install -v github.com/scottg489/loglint@latest

RUN cp ~/go/bin/loglint /usr/local/bin/

COPY run.sh /run.sh

CMD ["/run.sh"]
