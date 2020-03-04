FROM balenalib/rpi-alpine:3.11

ARG version

RUN apk -U update && \
    apk -U upgrade && \
    apk -U add --no-cache \
        libffi-dev \
        openssl-dev \
        libxml2-dev \
        libxslt-dev \
        linux-headers \
        build-base \
        python2-dev \
        git \
        python \
        py2-pip \
        py-openssl \
        py-lxml \
        nodejs \
    && \
    git clone --depth 1 https://github.com/SickRage/SickRage.git@@{version} /sickrage && \
    pip install -U pip setuptools && \
    pip install -r /sickrage/requirements.txt && \
    rm -rf /tmp/src && \
    rm -rf /var/cache/apk/*

EXPOSE 8081

ENTRYPOINT ["python", "/sickrage/SiCKRAGE.py", "--datadir=/config/"]
