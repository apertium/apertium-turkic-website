#!/bin/bash
docker run -d --rm --restart=unless-stopped -v /home/turkic/logs:/home/apertium/logs -p 8875:2737 --name apertium-turkic apertium-turkic
