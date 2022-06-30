FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install pm2 -g
ENV PM2_PUBLIC_KEY drbnfobrl2hn8hm
ENV PM2_SECRET_KEY 44ahpi4v79ureap

CMD ["pm2-runtime", "index.js"]
COPY . .

EXPOSE 5000

CMD ["npm", "start"]
