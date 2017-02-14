# Set up the system

sudo apt-get update
sudo apt-get install nginx -y
sudo apt-get install mysql-server -y
sudo apt-get install php-fpm php-mysql -y
sudo apt-get install nodejs -y
sudo cp default /etc/nginx/sites-available/default

# Set up the deployer

npm install -g pm2
npm install github-webhook-handler ip
pm2 start deploy.js
pm2 startup

