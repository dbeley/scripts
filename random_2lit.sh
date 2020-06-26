#!/usr/bin/env bash
find ~/Nextcloud/chan/lit/ -type f -print0 | shuf -zn1 | xargs -0 feh
