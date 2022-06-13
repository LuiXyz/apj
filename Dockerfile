FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install && git clone https://github.com/LuiXyz/Termux-Bot-md && cd Termux-Bot-md && npm install && npm install pm2 && pm2 start index.js && pm2 save 

COPY . .

EXPOSE 5000

CMD ["node", "index.js"]
