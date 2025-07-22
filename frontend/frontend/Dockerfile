# CloudOps Insight - Frontend Dockerfile
# Author: Niharika (mysorena@mail.uc.edu)
# Academic Project: University of Cincinnati
# Advisor: Bramha

# Multi-stage build for optimal production performance
# Stage 1: Build the React application
FROM node:18-alpine as builder

# Set metadata labels for academic project
LABEL maintainer="Niharika <mysorena@mail.uc.edu>"
LABEL institution="University of Cincinnati"
LABEL advisor="Bramha"
LABEL project="CloudOps Insight Frontend"
LABEL description="React Frontend for Natural Language Cloud Operations Interface"
LABEL version="0.1.0-alpha"

# Set working directory
WORKDIR /app

# Set environment variables for build optimization
ENV NODE_ENV=production
ENV REACT_APP_API_URL=http://localhost:8000
ENV REACT_APP_WS_URL=ws://localhost:8000
ENV GENERATE_SOURCEMAP=false

# Academic project environment variables
ENV REACT_APP_PROJECT_NAME="CloudOps Insight"
ENV REACT_APP_AUTHOR="Niharika"
ENV REACT_APP_INSTITUTION="University of Cincinnati"
ENV REACT_APP_ADVISOR="Bramha"
ENV REACT_APP_EMAIL="mysorena@mail.uc.edu"

# Copy package files for dependency installation
COPY package*.json ./

# Install dependencies with clean cache
RUN npm ci --only=production --silent \
    && npm cache clean --force

# Copy source code
COPY . .

# Build the React application
RUN npm run build

# Stage 2: Serve the application with Nginx
FROM nginx:alpine

# Install curl for health checks
RUN apk add --no-cache curl

# Set metadata for the final image
LABEL stage="production"
LABEL maintainer="Niharika <mysorena@mail.uc.edu>"
LABEL institution="University of Cincinnati"

# Copy built application from builder stage
COPY --from=builder /app/build /usr/share/nginx/html

# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Create academic project info file
RUN echo "🎓 CloudOps Insight Frontend Container" > /usr/share/nginx/html/academic-info.txt \
    && echo "University of Cincinnati - Capstone Project" >> /usr/share/nginx/html/academic-info.txt \
    && echo "Author: Niharika (mysorena@mail.uc.edu)" >> /usr/share/nginx/html/academic-info.txt \
    && echo "Advisor: Bramha" >> /usr/share/nginx/html/academic-info.txt \
    && echo "Research: Natural Language Interfaces for Infrastructure Management" >> /usr/share/nginx/html/academic-info.txt

# Create non-root user for security
RUN addgroup -g 1001 -S academicuser \
    && adduser -S academicuser -G academicuser -u 1001

# Set proper permissions
RUN chown -R academicuser:academicuser /usr/share/nginx/html \
    && chown -R academicuser:academicuser /var/cache/nginx \
    && chown -R academicuser:academicuser /var/log/nginx \
    && chown -R academicuser:academicuser /etc/nginx/conf.d \
    && touch /var/run/nginx.pid \
    && chown -R academicuser:academicuser /var/run/nginx.pid

# Switch to non-root user
USER academicuser

# Expose port 80
EXPOSE 80

# Health check for container monitoring
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:80/ || exit 1

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

# Development alternative (uncomment for development)
# FROM node:18-alpine
# WORKDIR /app
# COPY package*.json ./
# RUN npm install
# COPY . .
# EXPOSE 3000
# CMD ["npm", "start"]
