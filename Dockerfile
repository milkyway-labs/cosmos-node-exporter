FROM golang:1.23-alpine AS build-env

# Set up dependencies
ENV PACKAGES="curl make git libc-dev bash gcc linux-headers eudev-dev build-base"
RUN set -eux; apk add --no-cache $PACKAGES;

# Set working directory for the build
WORKDIR /code

# Add sources files
COPY . /code/

RUN make build


# Final image
FROM alpine:edge

# Install ca-certificates
RUN apk add --update ca-certificates
WORKDIR /home

# Install bash
RUN apk add --no-cache bash

# Copy over binaries from the build-env
COPY --from=build-env /code/cosmos-node-exporter /usr/bin/cosmos-node-exporter
ENTRYPOINT ["cosmos-node-exporter"]
