#!/bin/bash

# Update the package list
sudo yum update -y

# Install Node.js
sudo yum install -y nodejs

# Install Nginx
sudo yum install -y nginx

# Install Git
sudo yum install git -y

# Clone your React app repository
git clone <your-repository-url>

# Navigate to your app directory
cd <your-app-directory>

# Install dependencies
npm install

# Build your React app
npm run build

# Remove the default Nginx configuration
sudo rm /etc/nginx/conf.d/default.conf

# Create a new configuration file
sudo bash -c "cat > /etc/nginx/conf.d/react-app.conf << EOL
server {
    listen 80;
    server_name your-instance-public-dns;

    location / {
        root /home/ec2-user/<your-app-directory>/build;
        try_files \$uri /index.html;
    }
}
EOL"

# Start Nginx if it's not running
sudo systemctl start nginx

# Restart Nginx if it's already running
sudo systemctl restart nginx

# Enable Nginx to start at boot
sudo systemctl enable nginx