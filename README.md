# version checker - sever side

Version checker server side system.
This code is part of the MAS-RAD projects.
It provides an API which is used as a desktop application or attacked by
mobile devices.

## Ruby version
ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-darwin16]

## Rails version
Rails 5.1.1

## System dependencies
### QR-code encoder
rqrcode 0.10.1
https://github.com/whomwah/rqrcode
(MIT License)

## Database initialisation
``` ruby
 rails db:migrate
 rails db:seed
```

## TODO
* Filters on tables
* Write file path into the data base
* Integrity testing for files and qr-codes folders
* Removing files and qr-codes when deleting the doc
