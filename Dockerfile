FROM nginx

RUN apt-get update && apt-get install certbot python3-certbot-nginx cron -y

RUN mkdir -p /var/log/cron /scripts

COPY scripts/certbot-renew.sh /scripts/certbot-renew.sh

RUN echo "0 0 * * * /scripts/certbot-renew.sh >> /var/log/cron/daily-cron.log 2>&1 " > /etc/cron.d/certbot-renew-cron
RUN chmod 0644 /etc/cron.d/certbot-renew-cron

CMD ["/bin/bash", "-c", "service cron start && nginx -g 'daemon off;'"]
