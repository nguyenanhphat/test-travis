# Use an existing docker image as base
FROM node:alpine as builder
WORKDIR /app
# Download and install a dependency
COPY package.json .
RUN npm install --registry https://registry.npmjs.org
COPY . .
# Tell the image what to do when it start as a container
RUN npm run build


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html