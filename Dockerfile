FROM node:alpine
WORKDIR /app

# Copy and install dependencies, avoiding cache for this step
COPY package*.json .
RUN npm install --no-cache

# Copy the rest of the application code
COPY . .

EXPOSE 3000
CMD [ "npm", "start" ]
