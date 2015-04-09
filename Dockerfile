#
# Example Dockerfile - Version 1.0.1
#

# Pull base image.
FROM dockerfile/nodejs

# Version
RUN echo 1.0.1

# Pull latest code
RUN mkdir /var/site
WORKDIR /var/site
RUN git clone https://github.com/simonguest/docker-node.git .
RUN npm install

# open ports
EXPOSE 3000

# Default command
CMD ["node","/var/site/index.js"]
