# Use docker instead of alpine to favour `kubectl create secret docker-registry ...` with docker config file stored in ~/.docker/config.json
FROM docker:18.09 

LABEL MAINTAINER="William K. DEKOU <williamdekou@gmail.com>"

ENV KUBE_LATEST_VERSION="v1.13.0"

RUN apk add --update ca-certificates \
    && apk add --update -t deps curl \
    && apk add --update gettext \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && apk del --purge deps \
    && rm /var/cache/apk/*
