# docker build --no-cache -t apertium-turkic
FROM apertium-uum AS base

#ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true

USER root

#ADD turkic-repos.py /home/apertium/turkic-repos.py
#ADD pkgs.php /home/apertium/pkgs.php
#ADD repos.json /home/apertium/repos.json

# Copy in APy startup script
ADD run-apy.sh /home/apertium/run-apy.sh

RUN apt-get -qy update && apt-get -qfy --no-install-recommends dist-upgrade && apt-get -qfy -o Dpkg::Options::="--force-overwrite" install --no-install-recommends python3-tornado apertium-apy apertium-uum apertium-ukr apertium-eng apertium-rus apertium-uum-eng apertium-rus-ukr apertium-uum-ukr  && apt-get -qfy autoremove --purge  #  apertium-rus-eng  apertium-uum-ukr

RUN rm -rf /opt/apertium-apy
RUN git clone https://github.com/apertium/apertium-apy.git -b embeddings /opt/apertium-apy

FROM amd64/debian:bookworm
COPY --from=base / /

# Start up APy
USER 1006:1006
EXPOSE 2737
WORKDIR /home/apertium/
CMD ./run-apy.sh
