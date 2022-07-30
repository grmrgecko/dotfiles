#!/bin/bash

if pgrep openvpn > /dev/null; then
	echo -n "%{u#00bf07}"
else
	echo -n "%{u#ff1c01}"
fi
echo "VPN"
