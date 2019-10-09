FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

# /app/build is where things are generated in the build phase

FROM nginx
COPY --from=builder /app/build/ /usr/share/nginx/html

# default cmd of nginx starts the nginx server