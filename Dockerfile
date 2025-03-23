# Use Ubuntu as the base image
FROM ubuntu:latest

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive 

# Install required packages
RUN apt update && apt install -y python3 python3-pip python3-venv

# Set the working directory
WORKDIR /app

# Copy the application code
COPY . /app

# Create a virtual environment and install dependencies
RUN python3 -m venv /app/venv && \
    /app/venv/bin/pip install --upgrade pip && \
    /app/venv/bin/pip install -r requirements.txt

# Expose port 8000
EXPOSE 8000

# Use the virtual environment to run FastAPI
CMD ["/app/venv/bin/uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
