# Use the official Node.js 18 image with Alpine Linux for smaller size
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package files and install dependencies first for layer caching
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 3030

# Start the application (make sure your entry point is correct)
CMD ["node", "server.js"]