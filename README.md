# Nginx with certbot

0. Map your domain name to the server IP address on the domain provider's site.

1. Update nginx config

```bash
git clone https://github.com/vdx-vn/nginx-certbot

cd nginx-certbot

# replace <your domain name> to your real domain name
sed -i 's/demo.vdx.vn/<your domain name>/g' conf/default.conf

```

2. Run a stand alone nginx container to retrieve a ssl certificate

```bash
docker run -d \
           --name nginx-certbot \
           --volume ./ssl:/etc/letsencrypt \
           --volume ./conf:/etc/nginx/conf.d \
           ghcr.io/vdx-vn/nginx-certbot

# Execute the command and provide the required prompt data.
docker exec -it nginx-certbot certbot --nginx
```

3. If you request ssl certificate for an Odoo site

## Reference
1. [Generate SSL for localhost](https://github.com/FiloSottile/mkcert)

+ Use docker compose to start Odoo and nginx containers, check config file sample in conf/odoo.conf.template
+ Retrieve ssl certficate after those services are running

4. Update retrieved ssl certificates to nginx config
