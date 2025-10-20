# Custom web application Dockerfile
FROM nginx:alpine

# Set maintainer label
LABEL maintainer="student@example.com"
LABEL version="1.0"
LABEL description="Custom web app for Docker lab"

# Copy custom HTML content
COPY index.html /usr/share/nginx/html/

# Create a custom configuration file
RUN echo "server { listen 80; root /usr/share/nginx/html; }" > /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget --no-verbose --tries=1 --spider http://localhost/ || exit 1

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]