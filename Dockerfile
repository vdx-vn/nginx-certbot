FROM nginx

RUN apt-get update && apt-get install certbot python3-certbot-nginx cron -y

RUN mkdir -p /var/log/cron /scripts

COPY scripts/certbot-renew.sh /scripts/certbot-renew.sh
COPY scripts/certbot-renew-cron /etc/cron.d/certbot-renew-cron

RUN chmod 0644 /etc/cron.d/certbot-renew-cron
RUN crontab /etc/cron.d/certbot-renew-cron

CMD ["/bin/bash", "-c", "service cron start && nginx -g 'daemon off;'"]
