FROM alpine:3.24.2@sha256:294b683cb724975bec92580e1e685676bd4b50bda910ddb8c51d4cabeaec77e6

RUN apk add --no-cache go jq wget git

RUN wget https://github.com/cli/cli/releases/download/v2.31.0/gh_2.31.0_linux_amd64.tar.gz \
  && tar xvf gh_2.31.0_linux_amd64.tar.gz gh_2.31.0_linux_amd64/bin/gh \
  && mv gh_2.31.0_linux_amd64/bin/gh /usr/local/bin

RUN go install -v github.com/scottg489/loglint@latest

RUN cp ~/go/bin/loglint /usr/local/bin/

COPY run.sh /run.sh

CMD ["/run.sh"]
