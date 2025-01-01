FROM nginx

RUN apt-get update && apt-get install certbot python3-certbot-nginx cron -y
