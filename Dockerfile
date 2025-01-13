FROM nginx

RUN apt-get update && apt-get install certbot python3-certbot-nginx cron -y

RUN SLEEPTIME=$(awk 'BEGIN{srand(); print int(rand()*(3600+1))}'); echo "0 0,12 * * * root sleep $SLEEPTIME && certbot renew -q" | tee -a /etc/crontab > /dev/null
