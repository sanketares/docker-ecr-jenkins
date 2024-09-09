# Use an official lightweight base image
FROM ubuntu:latest

RUN yum install -y httpd

# Set the working directory in the container
WORKDIR /app

# Define a simple command to run
CMD ["echo", "Hello, World!"]
