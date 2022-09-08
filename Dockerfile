FROM node:12

WORKDIR /app

COPY package*.json .env ./

RUN npm install

COPY . .

CMD ["npm", "start"]