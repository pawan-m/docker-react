FROM node:alpine AS builder

WORKDIR /usr/apps 

COPY ./package.json ./

RUN npm install 

COPY . . 

RUN npm run build

FROM nginx 
EXPOSE 3000 

COPY --from=builder /usr/apps/build /usr/share/nginx/html 
