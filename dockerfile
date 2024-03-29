FROM node:alpine as initial
WORKDIR '/app'
COPY package.json ./ 
RUN npm install
COPY . . 
RUN npm run build

FROM nginx
COPY --from=initial /app/build /usr/share/nginx/html


