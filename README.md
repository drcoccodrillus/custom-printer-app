# custom-printer-app

A dockerized printer application based on CUPS for Custom printers

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