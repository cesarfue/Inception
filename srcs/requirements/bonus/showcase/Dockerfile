FROM node:22-bullseye

RUN apt-get update \
&& apt-get install -y openssl \
&& mkdir -p /etc/vite/ssl \
&& openssl req -x509 -nodes \
  -out /etc/vite/ssl/bundle.crt \
  -keyout /etc/vite/ssl/private.key \
  -subj "/C=FR/ST=RA/L=Lyon/O=42/OU=42/CN=cefuente.42.fr/UID=cefuente"

WORKDIR /usr/app
COPY ./app/ .



RUN npm install --save three
RUN npm install --save-dev vite
RUN npm install --save-dev @vitejs/plugin-vue


CMD ["npx", "vite"]
