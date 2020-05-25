#!/bin/bash
docker run -d --restart=unless-stopped -v /home/turkic/logs:/home/apertium/logs -p 8875:2737 apertium-turkic
