#!/bin/bash

country='BE'
state='WV'
city='Ypres'
company='HaPyTeΧ'
department='IT'

prefix="/C=$country/ST=$state/L=$city/O=$company/OU=$department/CN="

mkdir -p 'certificates'

for file in *.conf; do
  site=$(basename "$file" '.conf')
  openssl req -x509 -newkey rsa:4096 -keyout "certificates/$site.local.key" -out "certificates/$site.local.crt" -sha256 -days 3653 -nodes -subj "$prefix$site.local"
done

sudo cp certificates/* /etc/ssl/certs/
