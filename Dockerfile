# Use an official lightweight base image
FROM alpine:latest

# Set the working directory in the container
WORKDIR /app

# Define a simple command to run
CMD ["echo", "Hello, World!"]
