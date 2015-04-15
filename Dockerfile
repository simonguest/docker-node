FROM dockerfile/nodejs

# apt-get update
RUN apt-get update

# Pull latest code
RUN mkdir /var/site
ADD . /var/site

# Install npm dependencies
WORKDIR /var/site
RUN npm install
RUN npm install -g forever

# open ports
EXPOSE 3000

# Default command
CMD ["forever","/var/site/index.js"]
