FROM hypriot/rpi-python
MAINTAINER Yuri Teixeira <oyuriteixeira at gmail dot com>

ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb-src http://archive.raspbian.org/raspbian wheezy main contrib non-free rpi" > /etc/apt/sources.list.d/debian-sources.list

# Dependencies
RUN apt-get update \ 
    && apt-get install -y -q git-core python-lxml python-openssl \ 
    && apt-get -y autoremove && apt-get -y clean

RUN mkdir ~/unrar-nonfree && \
    cd ~/unrar-nonfree && \
    apt-get build-dep -y unrar-nonfree && \
    apt-get source -b -y unrar-nonfree && \
    dpkg -i unrar*.deb && \
    cd && \
    rm -r ~/unrar-nonfree

## Install Sickrage
RUN mkdir /sickrage && cd /sickrage && git clone https://github.com/SickRage/SickRage.git

## Expose port
EXPOSE 8081

## Run
WORKDIR /sickrage
ENTRYPOINT ["python", "SickRage/SickBeard.py", "--datadir=/config"]
