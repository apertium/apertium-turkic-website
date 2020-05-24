#!/bin/bash
docker run -it --rm -v /home/turkic/logs/:/home/apertium/logs/ -p 2737:8875 apertium-turkic 
