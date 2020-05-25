FROM amd64/debian:buster

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true

# UID/GID must match host's apy user
RUN mkdir -p /home/apertium
RUN groupadd -g 1006 apertium && useradd -d /home/apertium -M -u 1006 -g 1006 apertium
RUN chown 1006:1006 /home/apertium

# Upgrade everything and install base apertium dependencies
RUN apt-get -qy update && apt-get -qfy --no-install-recommends install apt-utils
RUN apt-get -qy update && apt-get -qfy --no-install-recommends dist-upgrade
RUN apt-get -qy update && apt-get -qfy --no-install-recommends install wget ca-certificates
RUN apt-get -qy update && apt-get -qfy --no-install-recommends install python3-tornado python3-chardet python3-requests
RUN wget https://apertium.projectjj.com/apt/install-nightly.sh -O - | bash
RUN apt-get -qy update && apt-get -qfy --no-install-recommends install apertium-all-dev
RUN apt-get -qy update && apt-get -qfy --no-install-recommends install file unzip zip apertium-apy
