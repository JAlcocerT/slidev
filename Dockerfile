# Robust Dockerfile for Slidev production
FROM mcr.microsoft.com/playwright:v1.44.1-jammy

WORKDIR /app

# Install dependencies first for better caching
COPY slidevsample/package*.json ./
RUN npm install

# Copy the rest of the application
COPY slidevsample/. ./

# Build the Slidev site
RUN npm run build

EXPOSE 3030
CMD ["npx", "http-server", "./dist", "-p", "3030"]
