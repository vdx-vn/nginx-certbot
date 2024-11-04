# Nginx with certbot

1. Update nginx config

```bash
git clone https://github.com/vdx-vn/nginx-certbot

cd nginx-certbot

# replace <your domain name> to your real domain name
sed -i 's/demo.vdx.vn/<your domain name>/g' conf/default.conf

```

2. Run a stand alone nginx container to retrieve a ssl certificate

```bash
docker run --name nginx-certbot \
           --volume ./ssl:/etc/letsencrypt \
           --volume ./conf:/etc/nginx/conf.d \
           ghcr.io/vdx-vn/nginx-certbot

docker exec -it nginx-certbot certbot --nginx
```
