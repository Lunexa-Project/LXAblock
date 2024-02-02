FROM golang:alpine as build
LABEL author="seth@sethforprivacy.com" \
      maintainer="seth@sethforprivacy.com"

# Set Lunexablock branch or tag to build
ARG LUNEXA_BLOCK_BRANCH=v0.1.1

# Set the proper HEAD commit hash for the given branch/tag in LUNEXA_BLOCK_BRANCH
ARG LUNEXA_BLOCK_COMMIT_HASH=de08fa10be7706c66f2374baa4d2bafc61fbe49e

# Upgrade base image
RUN set -ex && apk --update --no-cache upgrade

# Install git dependency
RUN set -ex && apk add --update --no-cache git

# Switch to Lunexablock source directory
WORKDIR /lunexablock

# Build Lunexablock from given branch and verify HEAD commit
RUN set -ex && git clone --branch ${LUNEXA_BLOCK_BRANCH} \
    https://github.com/lunexa-project/lunexablock. \
    && test `git rev-parse HEAD` = ${LUNEXA_BLOCK_COMMIT_HASH} || exit 1 \
    && go get ./... \
    && go build -ldflags="-s -w" ./

# Begin final image build
# Select Alpine 3.x for the base image
FROM alpine:3

# Upgrade base image
RUN set -ex && apk --update --no-cache upgrade

# Install curl for health check
RUN set -ex && apk add --update --no-cache curl

# Add user and setup directories for lunexablock
ARG LUNEXA_BLOCK_USER="lunexablock"
RUN set -ex && adduser -Ds /bin/bash ${LUNEXA_BLOCK_USER}

USER "${LUNEXA_BLOCK_USER}:${MOLUNEXA_BLOCK_USERNERO_USER}"

# Switch to home directory and install newly built lunexablock binary
WORKDIR /home/${LUNEXA_BLOCK_USER}
COPY --chown=${LUNEXA_BLOCK_USER}:${LUNEXA_BLOCK_USER} --from=build /lunexablock/lunexablock /usr/local/bin/lunexablock

# Expose web port
EXPOSE 31312

# Add HEALTHCHECK against get_info endpoint
HEALTHCHECK --interval=30s --timeout=5s CMD curl --fail http://localhost:31312 || exit 1

# Start lunexablock with default daemon flag, to be overridden by end-users
ENTRYPOINT ["lunexablock", "--bind", "0.0.0.0:31312"]
CMD ["--daemon", "node.sethforprivacy.com:18089"]
