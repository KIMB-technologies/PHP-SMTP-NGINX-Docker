#!/bin/sh
cat - | /usr/bin/msmtp \
	--host=$SMTP_SERVER \
	--port=$SMTP_PORT \
	--protocol=smtp \
	--tls=$TLS_ONOFF \
	--tls-starttls=$STARTTLS_ONOFF \
	--auth=on \
	--auto-from=on \
	--user=$SMTP_USER \
	--passwordeval=/bin/msmtpsendpw.sh \
	"$@"
