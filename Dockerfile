# Use an official lightweight base image
FROM alpine:latest

# Set the working directory in the container
WORKDIR /app

# Copy a shell script into the container
COPY hello.sh .

# Make the script executable
RUN chmod +x hello.sh

# Define the command to run the script
CMD ["./hello.sh"]
