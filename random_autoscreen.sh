#!/usr/bin/env bash
find ~/Nextcloud/07_Images/01_autoscreen/ -type f -print0 | shuf -zn1 | xargs -0 $IMG_VIEWER
