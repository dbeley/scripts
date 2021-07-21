#!/usr/bin/env bash
find ~/Disque500Go/Documents/Archive/chan/mu -type f -print0 | shuf -zn1 | xargs -0 $IMG_VIEWER
