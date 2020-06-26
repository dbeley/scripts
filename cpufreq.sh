#!/bin/bash

while true; do
    clear
    cat /proc/cpuinfo | grep MHz
    sleep 2
done

exit 0
