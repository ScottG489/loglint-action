FROM alpine:3.24.3@sha256:be2656061b536c1883c4034790e21d0a09c5aaaf51968b89368a3c0371ea2c9a

RUN apk add --no-cache go jq wget git

RUN wget https://github.com/cli/cli/releases/download/v2.31.0/gh_2.31.0_linux_amd64.tar.gz \
  && tar xvf gh_2.31.0_linux_amd64.tar.gz gh_2.31.0_linux_amd64/bin/gh \
  && mv gh_2.31.0_linux_amd64/bin/gh /usr/local/bin

RUN go install -v github.com/scottg489/loglint@latest

RUN cp ~/go/bin/loglint /usr/local/bin/

COPY run.sh /run.sh

CMD ["/run.sh"]
