FROM node:alpine

# Install Python and other build dependencies
RUN apk add --no-cache python3 make g++

WORKDIR /app
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

COPY . .
EXPOSE 3000
CMD [ "npm", "start" ]
