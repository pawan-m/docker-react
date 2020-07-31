FROM node:alpine AS builder

WORKDIR /usr/apps 

COPY ./package.json ./

RUN npm install 

COPY . . 

RUN npm run build

FROM nginx 

COPY --from=builder /usr/apps/build /usr/share/nginx/html 
