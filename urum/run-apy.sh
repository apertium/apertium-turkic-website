#!/bin/bash

LANG='en_US.UTF-8' python3 /opt/apertium-apy/apy.py \
                           -j1 \
                           -n1 \
                           -i2 \
                           -u3 \
                           -m300 \
                           -r1000 \
                           -d \
                           -P /home/apertium/logs/ \
                           /usr/share/apertium/
