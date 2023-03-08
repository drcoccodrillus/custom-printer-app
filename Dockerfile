FROM ubuntu:22.04 AS base

RUN apt-get update && apt-get upgrade -y

RUN apt-get update && apt-get install -y \
    apt-utils \
    usbutils \
    cups \
    libcups2-dev \
    libcupsimage2-dev

RUN apt-get autoremove -y && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt

COPY ./test-files /printers
COPY ./drivers /printers/drivers
COPY ./bin /printers/bin

#Drivers for Custom K3
WORKDIR /printers/drivers/k3
RUN chmod x86_64/755 rastertok3_64bit
RUN cp -f x86_64/rastertok3_64bit /usr/lib/cups/filter
RUN cp -f x86_64/K3_64bit.ppd /usr/share/cups/model

#Drivers for Custom KPM216H2
WORKDIR /printers/drivers/kpm216h3
RUN chmod 755 x86_64/rastertokpm216h3
RUN cp -f x86_64/rastertokpm216h3 /usr/lib/cups/filter
RUN cp -f x86_64/KPM216H3.ppd /usr/share/cups/model
RUN cp -f x86_64/libCeSmLm.so /usr/lib/

#Drivers for Custom KPM216H3
WORKDIR /printers/drivers/kpm216h3
RUN chmod 755 x86_64/rastertokpm216h3
RUN cp -f x86_64/rastertokpm216h3 /usr/lib/cups/filter
RUN cp -f x86_64/KPM216H3.ppd /usr/share/cups/model
RUN cp -f x86_64/libCeSmLm.so /usr/lib/

#Drivers for Custom Modus3
WORKDIR /printers/drivers/modus3
RUN chmod 755 x86_64/rastertomodus3
RUN cp -f x86_64/rastertomodus3 /usr/lib/cups/filter
RUN cp -f Modus3.ppd /usr/share/cups/model

#Drivers for Custom P3
WORKDIR /printers/drivers/p3
RUN chmod 755 x86_64/rastertop3
RUN cp -f x86_64/rastertop3 /usr/lib/cups/filter
RUN cp -f P3.ppd /usr/share/cups/model

#Drivers for Custom TL80
WORKDIR /printers/drivers/tl80
RUN chmod 755 rastertotl80
RUN cp -f x86_64/rastertotl80 /usr/lib/cups/filter
RUN cp -f TL80.ppd /usr/share/cups/model

#Drivers for Custom VK80-200
WORKDIR /printers/drivers/vk80-200
RUN chmod 755 rastertovk80_200
RUN cp -f x86_64/rastertovk80_200 /usr/lib/cups/filter
RUN cp -f VK80_200.ppd /usr/share/cups/model

#Drivers for Custom VK80-300
WORKDIR /printers/drivers/vk80-300
RUN chmod 755 rastertovk80_300
RUN cp -f x86_64/rastertovk80_300 /usr/lib/cups/filter
RUN cp -f VK80_300.ppd /usr/share/cups/model

#Drivers for Custom VKP80II
WORKDIR /printers/drivers/vkp80II
RUN chmod 755 rastertovkp80
RUN cp -f x86_64/rastertovkp80 /usr/lib/cups/filter
RUN cp -f VKP80.ppd /usr/share/cups/model

#Drivers for Custom VKP80III
WORKDIR /printers/drivers/vkp80III
RUN chmod 755 rastertovkp80iii
RUN cp -f x86_64/rastertovkp80iii /usr/lib/cups/filter
RUN cp -f VKP80III.ppd /usr/share/cups/model

#Udev rules (This is for KPM216H2 and KPM216H3)
WORKDIR /printers/drivers
RUN cp -f 99-custom-printers.rules /etc/udev/rules.d/

RUN rm -rf /printers/drivers

WORKDIR /printers/bin
RUN chmod +x start.sh
RUN ln -s /printers/bin/start.sh /bin/discovery

ENTRYPOINT ["/usr/sbin/cupsd", "-f"]
