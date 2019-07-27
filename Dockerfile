FROM docker:latest

ENV VERSION 0.6.0

RUN apk add --update --no-cache \
    bash \
    py-pip \
    python-dev \
    libffi-dev \
    git \
    curl \
    openssh \
    openssl \
    openssl-dev \
    gcc \
    g++ \
    libc-dev \
    make


RUN curl -L https://github.com/AGWA/git-crypt/archive/$VERSION.tar.gz | tar zxv -C /var/tmp
RUN cd /var/tmp/git-crypt-$VERSION \
    && make \
    && make install PREFIX=/usr/local
RUN pip install docker-compose
