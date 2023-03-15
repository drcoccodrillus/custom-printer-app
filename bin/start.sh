#!/bin/bash

sleep 5

SEARCH_CUSTOM_K3=$(lsusb | awk '{print $6}' | grep "0dd4:020a")
SEARCH_CUSTOM_KPM216H2=$(lsusb | awk '{print $6}' | grep "0dd4:01a2")
SEARCH_CUSTOM_KPM216H3=$(lsusb | awk '{print $6}' | grep "0dd4:019a")
SEARCH_CUSTOM_Modus3=$(lsusb | awk '{print $6}' | grep "0dd4:023b")
SEARCH_CUSTOM_TG2460H=$(lsusb | awk '{print $6}' | grep "0dd4:01a7")
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

if [ "$SEARCH_CUSTOM_KPM216H2" = "0dd4:01a2" ]; then
    /usr/sbin/lpadmin -x kpm216h2
    /usr/sbin/lpadmin -p kpm216h2 -v usb://CUSTOM%20Engineering/KPM216H200
    /usr/sbin/lpadmin -p kpm216h2 -m KPM216H2.ppd
    /usr/sbin/lpadmin -p kpm216h2 -o printer-is-shared=true
    /usr/sbin/lpadmin -d kpm216h2
    /usr/sbin/cupsenable kpm216h2
    /usr/sbin/cupsaccept kpm216h2
fi

if [ "$SEARCH_CUSTOM_Modus3" = "0dd4:023b" ]; then
    /usr/sbin/lpadmin -x modus3
    /usr/sbin/lpadmin -p modus3 -v usb://CUSTOM%20SPA/MODUS3?serial=MODUS3_USB_Num.:_0
    /usr/sbin/lpadmin -p modus3 -m Modus3.ppd
    /usr/sbin/lpadmin -p modus3 -o printer-is-shared=true
    /usr/sbin/lpadmin -d modus3
    /usr/sbin/cupsenable modus3
    /usr/sbin/cupsaccept modus3
fi

if [ "$SEARCH_CUSTOM_TG2460H" = "0dd4:01a7" ]; then
    /usr/sbin/lpadmin -x tg2460h
    /usr/sbin/lpadmin -p tg2460h -v usb://CUSTOM%20Engineering/TG2460-H?serial=TG2460-H%20Num.:%200
    /usr/sbin/lpadmin -p tg2460h -m Modus3.ppd
    /usr/sbin/lpadmin -p tg2460h -o printer-is-shared=true
    /usr/sbin/lpadmin -d tg2460h
    /usr/sbin/cupsenable tg2460h
    /usr/sbin/cupsaccept tg2460h
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
