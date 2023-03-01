FROM ubuntu:22.04 AS base

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
    apt-utils \
    usbutils \
    cups \
    libcups2-dev \
    libcupsimage2-dev

RUN apt-get autoremove -y && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt

COPY ./drivers /printers/drivers
COPY ./bin /printers/bin

#Drivers for Custom K3
WORKDIR /printers/drivers/k3
RUN cp -f x86_64/rastertok3_64bit /usr/lib/cups/filter
RUN cp -f x86_64/K3_64bit.ppd /usr/share/cups/model

#Drivers for Custom TL80
WORKDIR /printers/drivers/tl80
RUN cp -f x86_64/rastertotl80 /usr/lib/cups/filter
RUN cp -f TL80.ppd /usr/share/cups/model

#Drivers for Custom VKP80II
WORKDIR /printers/drivers/vkp80II
RUN cp -f x86_64/rastertovkp80 /usr/lib/cups/filter
RUN cp -f VKP80.ppd /usr/share/cups/model

#Drivers for Custom VKP80III
WORKDIR /printers/drivers/vkp80III
RUN cp -f x86_64/rastertovkp80iii /usr/lib/cups/filter
RUN cp -f VKP80III.ppd /usr/share/cups/model

RUN rm -rf /printers/drivers

WORKDIR /printers/bin
RUN chmod +x start.sh
RUN ln -s /printers/bin/start.sh /bin/discovery

CMD ["/usr/sbin/cupsd", "-f"]
