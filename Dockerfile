FROM python:3.8-buster  3.8-alpine3.11
#FROM alpine:3.8

# update and install basic tools: Bash, Netcat, IP Utils (incl. Ping), curl, vim
RUN set -x && \
    apk update && apk upgrade && \
    apk add --update bash netcat-openbsd iputils curl vim

# install kubeclt
# Note: Latest version number may be found on: https://storage.googleapis.com/kubernetes-release/release/stable.txt
ADD https://storage.googleapis.com/kubernetes-release/release/v1.11.2/bin/linux/amd64/kubectl /usr/local/bin/kubectl
RUN set -x && \
    apk add --no-cache curl ca-certificates && \
    chmod +x /usr/local/bin/kubectl && \
    mkdir -p ~/.kube

CMD "while true; do date; kubectl get namespaces; sleep 10; done"
