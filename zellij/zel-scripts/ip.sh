#!/usr/bin/env bash

ip=($(ip addr show | grep -oP '(?<=inet\s)\d+\.\d+\.\d+\.\d+' | awk 'NR==2'))
echo "#[fg=#a177b3]$ip"
