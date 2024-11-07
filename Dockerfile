# Start from a basic Linux image (Debian/Alpine)
#FROM debian:bullseye-slim
# Use Arch Linux as the base image
FROM archlinux:latest

# Set the working directory
WORKDIR /app

# Install reflector separately for better control over mirror selection
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm reflector

# Update mirror list with the top 10 most recently synchronized mirrors
RUN reflector --latest 10 --sort rate --save /etc/pacman.d/mirrorlist

# Refresh package database with updated mirrors and install necessary packages
RUN pacman -Syu --noconfirm --disable-download-timeout --overwrite '*' && \
    pacman -S --noconfirm python python-pip python-virtualenv gcc bash

# Copy requirements file
COPY requirements.txt /app/

# Create and activate the virtual environment, then install dependencies
RUN python -m venv env_ && \
    /bin/bash -c "source env_/bin/activate && pip install --no-cache-dir -r requirements.txt"
    
# Copy the app source code and other files to the container
COPY . /app/



# Expose port 8000 for FastAPI
EXPOSE 8000

# Set the command to run your FastAPI app (adjust the path to your ASGI app)
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]