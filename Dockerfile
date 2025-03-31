# Builder here is an alias fro our stage
FROM node:lts-alpine as Builder

WORKDIR /app

COPY package.json .
RUN npm i
COPY . .
## Will be the output in /app/build
RUN npm run build

FROM nginx
# Instruction for ElasticBeanstalk
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html