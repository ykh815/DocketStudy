FROM node:alpine as builder
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx as runner
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
