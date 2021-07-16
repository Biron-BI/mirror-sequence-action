FROM alpine:3.10

RUN apk update && apk upgrade && \
    apk add --no-cache git openssh

# Copies code files from action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
COPY mirror.sh /mirror.sh

# Code file to execute when the docker container starts up
ENTRYPOINT ["/entrypoint.sh"]