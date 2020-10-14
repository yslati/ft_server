#! /usr/bin/expect -f

set timeout -1

spawn openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

expect "Country Name (2 letter code) "
send "MA\r"

expect "State or Province Name (full name) "
send "khouribga\r"

expect "Locality Name (eg, city) "
send "khouribga\r"

expect "Organization Name (eg, company) "
send "1337\r"

expect "Organizational Unit Name (eg, section) "
send "42\r"

expect "Common Name (e.g. server FQDN or YOUR name) "
send "yassin\r"

expect "Email Address "
send "sltyassin@gmail.com\r"
expect eof
