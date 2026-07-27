#!/usr/bin/env bash

sudo modprobe dvb_usb_rtl28xxu
[[ ! -f "dvb.xspf" ]] && w_scan_cpp -f a -c US -L > dvb.xspf
vlc dvb.xspf