#!/usr/bin/env bash


if ip addr show tun0 &> /dev/null; then
    echo "#[fg=#d098c0]VPN"
else
    echo "#[fg=#a177b3]VPN"
fi

