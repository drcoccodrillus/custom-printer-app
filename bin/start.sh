#!/bin/bash

sleep 5

SEARCH_CUSTOM_K3=$(lsusb | awk '{print $6}' | grep "0dd4:020a")
SEARCH_CUSTOM_TL80=$(lsusb | awk '{print $6}' | grep "0dd4:01ac")

for s in $(lpstat -v | grep -v "/dev/null" | awk '{print $3}' | sed s/://g); do
    /usr/sbin/cupsdisable $s
done

sleep 5

if [ "$SEARCH_CUSTOM_K3" = "0dd4:020a" ]; then
    /usr/sbin/lpadmin -x k3
    /usr/sbin/lpadmin -p k3 -v usb://CUSTOM%20Engineering/K3?serial=K3_PRN_Num.:_0
    /usr/sbin/lpadmin -p k3 -m K3_64bit.ppd
    /usr/sbin/lpadmin -p k3 -o printer-is-shared=true
    /usr/sbin/lpadmin -d k3
    /usr/sbin/cupsenable k3
    /usr/sbin/cupsaccept k3
fi

if [ "$SEARCH_CUSTOM_TL80" = "0dd4:01ac" ]; then
    /usr/sbin/lpadmin -x tl80
    /usr/sbin/lpadmin -p tl80 -v usb://CUSTOM%20Engineering/TL80?serial=TL80%20Num.:%200
    /usr/sbin/lpadmin -p tl80 -m TL80.ppd
    /usr/sbin/lpadmin -p tl80 -o printer-is-shared=true
    /usr/sbin/lpadmin -d tl80
    /usr/sbin/cupsenable tl80
    /usr/sbin/cupsaccept tl80
fi
