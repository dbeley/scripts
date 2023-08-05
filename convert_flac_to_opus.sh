#!/usr/bin/env bash
fd -e flac -x ffmpeg -i "{}" -b:a 128k -loglevel quiet -stats "{.}.opus"; done
