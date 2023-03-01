# custom-printer-app

A dockerized printer application based on CUPS for Custom printers

***

## Supported printers

The following Custom printers are fully supported

- K3
- VKP80II
- VKP80III

The following Custom printers have not been tested yet
- K3-X
- TL80
- TL80III

## How to use it

Using this printer application is pretty simple. Just follow the steps below in order to make it working on your system.

### Clone the repository

`git clone git@github.com:drcoccodrillus/custom-printer-app.git`

### Build the image

`docker-compose up --build -d`

### Connect the printer

Connect your Custom printer to your machine

### Initialize the printer app

`docker exec custom-printer discovery`

### Check if your printer has been configured

`docker exec custom-printer lpstat -t`

### Use your printer

`docker exec custom-printer lp -d printer-name /test-files/test.txt`