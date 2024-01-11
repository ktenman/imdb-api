# Build stage for compiling native dependencies
FROM node:18-alpine as builder

# Install Python and build dependencies
RUN apk add --no-cache python3 make g++

# Set working directory
WORKDIR /app

# Install Node.js dependencies
COPY package*.json ./
RUN npm install

# Copy application code (separate stage)
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy node modules and built assets from the builder stage
COPY --from=builder /app/node_modules ./node_modules
COPY . .

# Expose port and define command
EXPOSE 3000
CMD [ "npm", "start" ]
