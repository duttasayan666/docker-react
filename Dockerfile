FROM node:alpine as builderphse

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build



FROM nginx
EXPOSE 80
COPY --from=builderphse /app/build /usr/share/nginx/html
