#!/bin/bash
cd /home/turkic/logs
STAMP=`date -u '+%Y%m%d-%H%M'`
mv -f apertium-apy-uum.err apertium-apy-uum.err-$STAMP
mv -f apertium-apy-uum.log apertium-apy-uum.log-$STAMP
docker restart apertium-uum
find . -type f -name 'apertium-apy.*' -mtime +60 -exec rm -fv {} \;
