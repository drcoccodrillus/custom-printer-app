# custom-printer-app

A dockerized printer application based on CUPS for Custom® printers

***

## Supported printers

The following Custom printers are fully supported

- K3            (911HM010100733 - PRINTER K3 ETH USB RS232)
- K3-X          ()
- Modus3        (915LF010100300 - PRINTER MODUS3 USB RS232 COMPACT)
- TG2460H       (915CG020300300 - PRINTER TG2460H USB RS232)
- TL80          (915CK010500300 - PRINTER TL80 USB RS232)
- TL80III       (915CK020100300 - PRINTER TL80III USB RS232)
- VKP80II       (915DW011000300 - PRINTER VKP80II SX USB RS232)
- VKP80III      (915DX010700300 - PRINTER VKP80III USB RS232 REAR CONN.)

The following Custom printers have not been tested yet
- KPM216HII     (915AS020200300 - PRINTER KPM216HII RS232 USB 200 DPI)
- KPM216HIII    (915AS050100700 - PRINTER KPM216HIII ETH USB RS232 ESP)
- P3            (911MH010100733 - PRINTER P3 ETH USB RS232)
- VK80          (915DY010100J00 - PRINTER VK80 ETH USB REAR CONN.)
- VK80          (915DY020200700 - PRINTER VK80 ETH USB LATERAL CONNEC. 300)

## How to use it

Using this printer application is pretty simple. Just follow the steps below in order to make it working on your system.

### Clone the repository

`git clone git@github.com:drcoccodrillus/custom-printer-app.git`

### Build the image

`docker-compose up --build -d`

### Connect the printer

Connect your Custom printer to your machine

### Initialize the printer app

`docker exec custom-printers discovery`

### Check if your printer has been configured

`docker exec custom-printers lpstat -t`

### Use your printer

`docker exec custom-printers lp -d printer-name /printers/test.txt`

## To do

- [x] Full support for K3
- [ ] Full support for K3-X
- [x] Full support for Modus3
- [x] Full support for KPM216HII
- [ ] Full support for KPM216HIII
- [ ] Full support for P3
- [x] Full support for TG2460H
- [x] Full support for TL80
- [ ] Full support for TL80III
- [ ] Full support for VK80
- [ ] Full support for VKP80II
- [ ] Full support for VKP80III
- [ ] Automatic retrieving of printer device uri and printer setup 


## Troubleshooting

Sometimes things simply go wrong. If you need to troubleshoot CUPS these are places you should look at:
- `/var/log/cups/access_log` - Lists all cupsd http1.1 server activity
- `/var/log/cups/error_log` - Lists detailed information of the printing process
- `/var/log/cups/page_log` - Echoes a new entry each time a print is successful
- `/var/spool/cups` - Location where the scheduler stores job files


The best way to get complete information from log files is to set `LogLevel` in `/etc/cups/cupsd.conf` as the following:

```
LogLevel debug
```

And then viewing the output from `/var/log/cups/error_log` like this:
```
tail -n 100 -f /var/log/cups/error_log
```

The `/var/spool/cups` location stores two types of files: control files starting with the letter "c" and data files starting with the letter "d". Control files are IPP messages based on the original IPP Print-Job or Create-Job messages, while data files are the original print files that were submitted for printing. There is one control file for every job known to the system and 0 or more data files for each job.

Control files are normally cleaned out after the 500th job is submitted, while data files are removed immediately after a job has successfully printed. Both behaviors can be configured.
