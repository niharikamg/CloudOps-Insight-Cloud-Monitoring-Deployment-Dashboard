# CloudOps Insight - Backend Dockerfile
# Author: Niharika (mysorena@mail.uc.edu)
# Academic Project: University of Cincinnati
# Advisor: Bramha

# Use Python 3.11 slim image for optimal performance
FROM python:3.11-slim

# Set metadata labels for academic project
LABEL maintainer="Niharika <mysorena@mail.uc.edu>"
LABEL institution="University of Cincinnati"
LABEL advisor="Bramha"
LABEL project="CloudOps Insight"
LABEL description="Natural Language Interface for Cloud Operations - Academic Research"
LABEL version="0.1.0-alpha"

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONPATH=/app \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        git \
        libpq-dev \
        gcc \
        g++ \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Create non-root user for security (academic best practices)
RUN groupadd -r academicuser && useradd -r -g academicuser -d /app -s /bin/bash academicuser

# Copy requirements first for better caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --upgrade pip \
    && pip install -r requirements.txt \
    && pip cache purge

# Copy application code
COPY . .

# Create necessary directories
RUN mkdir -p /app/logs /app/data \
    && chown -R academicuser:academicuser /app

# Switch to non-root user
USER academicuser

# Expose port 8000 for FastAPI
EXPOSE 8000

# Health check for container monitoring
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8000/api/v1/health || exit 1

# Academic project startup message
RUN echo "🎓 CloudOps Insight Backend Container" > /app/startup.txt \
    && echo "University of Cincinnati - Capstone Project" >> /app/startup.txt \
    && echo "Author: Niharika (mysorena@mail.uc.edu)" >> /app/startup.txt \
    && echo "Advisor: Bramha" >> /app/startup.txt

# Default command to run the application
CMD ["python", "-m", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

# Alternative production command (uncomment for production)
# CMD ["python", "-m", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--workers", "4"]

# Academic development command with extra logging
# CMD ["python", "-m", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload", "--log-level", "debug"]
