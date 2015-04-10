#
# Example Dockerfile - Version 1.0.1
#

# Pull base image.
FROM dockerfile/nodejs

# Version
RUN echo 1.0.3

# apt-get update
RUN apt-get update

# Install PhantomJS
RUN apt-get install bzip2 curl libfreetype6 libfontconfig1  -y
RUN curl -k -O https://phantomjs.googlecode.com/files/phantomjs-1.9.2-linux-x86_64.tar.bz2
RUN tar -xvf phantomjs-1.9.2-linux-x86_64.tar.bz2 && rm phantomjs-1.9.2-linux-x86_64.tar.bz2
RUN mv phantomjs-1.9.2-linux-x86_64 /usr/local/phantomjs-1.9.2-linux-x86_64
RUN ln -s /usr/local/phantomjs-1.9.2-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs

# Pull latest code
RUN mkdir /var/site
WORKDIR /var/site
RUN git clone https://github.com/simonguest/docker-node.git .
RUN npm install

# open ports
EXPOSE 3000

# Default command
CMD ["node","/var/site/index.js"]
