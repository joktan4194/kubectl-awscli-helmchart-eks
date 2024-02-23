FROM alpine

RUN apk update
RUN apk add aws-cli
RUN apk add --no-cache ca-certificates unzip bash git openssl openssh wget curl gettext jq bind-tools \
    && wget -q https://amazon-eks.s3.us-west-2.amazonaws.com/1.20.4/2021-04-12/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && wget -q https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/aws-iam-authenticator -O /usr/local/bin/aws-iam-authenticator \
    && chmod +x /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/aws-iam-authenticator \
    && curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash \
    && chmod +x /usr/local/bin/helm \
    && chmod g+rwx /root \
    && mkdir /config \
    && chmod g+rwx /config
    

WORKDIR /config
COPY base /config/base

CMD bash