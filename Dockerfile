FROM dockerfile/nodejs

# apt-get update
RUN apt-get update

# Pull latest code
RUN mkdir /var/site
ADD . /var/site

# Install npm dependencies
WORKDIR /var/site
RUN npm install
RUN npm install -g pm2

# open ports
EXPOSE 3000

# Default command
CMD pm2 start index.js --no-daemon