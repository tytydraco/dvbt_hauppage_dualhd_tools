#!/usr/bin/env bash

sudo modprobe dvb_usb_rtl28xxu

if [[ ! -f "atsc.conf" ]]; then
    echo "Doing initial scan..."

    w_scan_cpp \
        -f a \
        -c US \
        -x \
        initial.conf
    dvbv5-scan \
        -C US \
        -o atsc.conf \
        initial.conf
    rm initial.conf

    echo "Initial scan done. Use full channel name (including whitespaces) as the first parameter."
fi

dvbv5-zap \
    -C US \
    -r \
    -c atsc.conf \
    "${1:-C1}" &
sleep 5
ffmpeg \
    -y \
    -i /dev/dvb/adapter0/dvr0 \
    -f matroska \
    -map 0:v:0 \
    -map 0:a:0 \
    -c:v libsvtav1 \
    -c:a aac \
    "${2:-"$(date -I)_${1:-C1}.mkv"}"