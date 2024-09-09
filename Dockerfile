# Use an official lightweight base image
FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y apache2

# Set the working directory in the container
WORKDIR /app

# Define a simple command to run
CMD ["echo", "Hello, World!"]
