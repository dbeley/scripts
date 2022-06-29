#!/usr/bin/env bash
sudo systemctl stop systemd-resolved
sudo wg-quick down wg1
