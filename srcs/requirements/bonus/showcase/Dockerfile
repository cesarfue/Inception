FROM debian:buster

ENV NODE_VERSION=16.13.0
ENV NVM_DIR=/root/.nvm

RUN apt-get update \
&& apt-get install -y openssl \
&& mkdir -p /etc/vite/ssl \
&& openssl req -x509 -nodes \
  -out /etc/vite/ssl/bundle.crt \
  -keyout /etc/vite/ssl/private.key \
  -subj "/C=FR/ST=RA/L=Lyon/O=42/OU=42/CN=cefuente.42.fr/UID=cefuente"

RUN apt install -y curl
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}

ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

WORKDIR /usr/app
COPY ./app/ .

RUN npm install --save three
RUN npm install --save-dev vite
RUN npm install --save-dev @vitejs/plugin-vue

CMD ["npx", "vite"]
