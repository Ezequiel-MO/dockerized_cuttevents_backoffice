FROM node:16-alpine AS builder
WORKDIR '/home/node/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /home/node/app/dist /usr/share/nginx/html

