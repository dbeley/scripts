#!/usr/bin/env bash
for file in *.flac; do ffmpeg -i "$file" -b:a 128k "${file%.*}.opus"; done
