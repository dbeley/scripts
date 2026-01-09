#!/usr/bin/env bash
find ~/nfs/WDC14/Documents/chan/mu -type f -print0 | shuf -zn1 | xargs -0 "$IMG_VIEWER"
