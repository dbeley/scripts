#!/usr/bin/env bash
for file in *.flac; do ffmpeg -i "$file" "${file%.*}.opus"; done
