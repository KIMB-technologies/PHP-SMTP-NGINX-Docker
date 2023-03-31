ARG BASEIMAGE_TAG=latest
FROM kimbtechnologies/php_nginx:latest

# copy own msmtp sender
COPY ./msmtpsend.sh ./msmtpsendpw.sh /bin/

# install msmtp, and set helber script as mailer
RUN apk add --update --no-cache msmtp \
	&& echo "php_admin_value[sendmail_path] = /bin/msmtpsend.sh -t -i" > /usr/local/etc/php-fpm.d/zz-msmtp.conf \
	&& chmod +x /bin/msmtpsend.sh \
	&& chmod +x /bin/msmtpsendpw.sh

ENV TLS_ONOFF=on \ 
	STARTTLS_ONOFF=on 