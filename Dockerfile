FROM ubuntu:latest

RUN useradd -ms /bin/bash user

RUN apt-get update
RUN apt-get install unzip wget -y
#the following ARG turns off the questions normally asked for location and timezone for Apache
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install apache2 -y 

#change working directory to root of apache webhost
WORKDIR var/www/html

#adding an example html to see if I am adding correctly to the working dir
    #COPY Collart_Potree.zip Collart_Potree.zip

    #RUN chown -R user:user Collart_Potree.zip /var/www/html
    #RUN chmod 777 Collart_Potree.zip

    #RUN unzip Collart_Potree.zip && rm Collart_Potree.zip

#Currently not needed, because of the attachment of SeaweedFS. Attach new files through dml(2).nrp-nautilius.io 

RUN rm index.html

#now start the server
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
