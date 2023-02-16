# set the base image to build from 
FROM node:alpine
WORKDIR /app
COPY package.json ./
COPY pnpm-lock.yaml ./

# install dependencies
RUN npm install -g pnpm
RUN pnpm install

# copy the source code
COPY ./ ./

# Run the app
CMD ["pnpm", "start"]

FROM nginx:alpine
COPY dist /usr/share/nginx/html