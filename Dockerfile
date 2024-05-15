# Use a Node.js base image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json files to the working directory
COPY package*.json ./

# Copy the source code files into the container
COPY . .

# Verify that the required files are present
RUN ls -a

# Command to run the application
# CMD ["npm", "start"]
