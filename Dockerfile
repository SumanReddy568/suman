# Use an official Nginx image as the base image
FROM nginx:alpine

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Remove the default Nginx static assets
RUN rm -rf ./*

# Copy the project files from your host to the Nginx HTML folder
COPY . .

# Expose port 80 to the host machine
EXPOSE 80

# Add a simple healthcheck
HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
