FROM ubuntu:latest

RUN apt-get update
#the following ARG turns off the questions normally asked for location and timezone for Apache
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install apache2 -y

#change working directory to root of apache webhost
WORKDIR var/www/html

#adding an example html to see if I am adding correctly to the working dir
COPY test.html test.html

#now start the server
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
