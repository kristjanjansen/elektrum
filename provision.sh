# Install required packages

sudo apt-get update
sudo apt-get install nginx -y
sudo apt-get install mysql-server -y
sudo apt-get install php-fpm php-mysql -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

# Copy Nginx config

sudo cp default /etc/nginx/sites-available/default
sudo systemctl reload nginx

# Set up the deployer

npm install -g pm2
npm install github-webhook-handler ip
pm2 start deploy.js
pm2 startup

# Set up the project

git clone https://github.com/kristjanjansen/nauka /var/nauka

