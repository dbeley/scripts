#!/usr/bin/env bash
find ~/nfs/WDC14/Documents/chan/g/ -type f -print0 | shuf -zn1 | xargs -0 "$IMG_VIEWER"
