#!/bin/bash
docker run -it --rm -v /home/turkic/logs/:/home/apertium/logs/ -p 8875:2737 apertium-turkic 
