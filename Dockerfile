# Use Python 3.11 slim image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg git curl wget zip unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 

# Copy application code
COPY app.py .

# Expose port (Heroku will set the PORT env variable)
EXPOSE $PORT

# Run the application with gunicorn
CMD  bash start
