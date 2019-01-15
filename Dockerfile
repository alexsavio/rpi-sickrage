FROM hypriot/rpi-alpine:3.6

RUN apk -U update && \
    apk -U upgrade && \
    apk -U add \
        git \
        python \
        py-openssl \
        py-lxml \
        nodejs \
    && \
    git clone --depth 1 https://github.com/SickRage/SickRage.git /sickrage && \
    rm -rf /tmp/src && \
    rm -rf /var/cache/apk/*

EXPOSE 8081

ENTRYPOINT ["python", "/sickrage/SiCKRAGE.py", "--datadir=/config/"]
