# PHP-NGINX-Docker and Mail

An easy to use php and NGINX image for Docker enabling the php `mail()` function.

> No mail needed?  
> See the base image at https://hub.docker.com/r/kimbtechnologies/php_nginx

The image internally uses `msmtp` to forward all mails over an SMTP server.
It simply replaces `sendmail` with `msmtp` in the php configuration.

Currently available for AMD64, ARMv6, ARMv7 and ARM64 (v8).

## Docker Compose

Example file for a Docker Compose setup to use with your own php code: [`docker-compose.yml`](./docker-compose.yml)

