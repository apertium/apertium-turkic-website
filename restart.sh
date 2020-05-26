#!/bin/bash
cd /home/turkic/logs
STAMP=`date -u '+%Y%m%d-%H%M'`
mv -f apertium-apy.err apertium-apy.err-$STAMP
mv -f apertium-apy.log apertium-apy.log-$STAMP
docker restart apertium-turkic
find . -type f -name 'apertium-apy.*' -mtime +60 -exec rm -fv {} \;
