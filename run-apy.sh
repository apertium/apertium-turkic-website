#!/bin/bash

LANG='en_US.UTF-8' apertium-apy \
                           -j1 \
                           -n1 \
                           -i2 \
                           -u3 \
                           -m300 \
                           -r1000 \
                           -P /home/apertium-apy/logs/ \
                           -l /usr/share/apertium-apy/langNames.db \
                           /usr/share/apertium/
