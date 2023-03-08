# custom-printer-app

A dockerized printer application based on CUPS for Custom printers

***

## Supported printers

The following Custom printers are fully supported

- K3
- K3-X
- TL80
- TL80III
- VKP80II
- VKP80III

The following Custom printers have not been tested yet
- VK80 (915DY010100J00 - PRINTER VK80 ETH USB REAR CONN.)
- VK80 (915DY020200700 - PRINTER VK80 ETH USB LATERAL CONNEC. 300)

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