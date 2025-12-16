FROM alpine:3.23.0@sha256:51183f2cfa6320055da30872f211093f9ff1d3cf06f39a0bdb212314c5dc7375

RUN apk add --no-cache go=1.20.11-r0 jq=1.6-r4 wget=1.21.4-r0 git=2.40.4-r0

RUN wget https://github.com/cli/cli/releases/download/v2.31.0/gh_2.31.0_linux_amd64.tar.gz \
  && tar xvf gh_2.31.0_linux_amd64.tar.gz gh_2.31.0_linux_amd64/bin/gh \
  && mv gh_2.31.0_linux_amd64/bin/gh /usr/local/bin

RUN go install -v github.com/scottg489/loglint@latest

RUN cp ~/go/bin/loglint /usr/local/bin/

COPY run.sh /run.sh

CMD ["/run.sh"]
