# PHP-NGINX-Docker and Mail

An easy to use php and nginx image for docker enabling the php `mail()` function.

> No mail needed?  
> See the base image at https://hub.docker.com/r/kimbtechnologies/php_nginx

The image internally uses `msmtp` to forward all mails over an smtp server. `msmtp` 
replaces `sendmail` in php configuration.

## Docker Compose

Example file for a Docker Compose setup with own php code.

```yaml

version: "2"

services:
  web:
    image: kimbtechnologies/php_smtp_nginx:latest # uses php 7.4
    #image: kimbtechnologies/php_smtp_nginx:8-latest # uses php 8.*
    container_name: php_smtp_nginx
    ports:
      - "127.0.0.1:8080:80"
    volumes:
      - ./php/:/php-code/ # load custom php code
    restart: always
    environment:
      - SMTP_SERVER= # the mail server host
      - SMTP_PORT= # the port to deliver mails (587 for starttls or 465 for tls)
      - SMTP_USER= # the username for the mail server
      - SMTP_PASS= # the password for the mail server
      # - STARTTLS_ONOFF=off # defaults to on (uncomment if using port 465)
      # - TLS_ONOFF=off # defaults to on

```
