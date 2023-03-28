#Pulling latest ubuntu image from docker hub
FROM ubuntu:latest

MAINTAINER Srikanth Sathiraju <srikanthsathiraju20@gmail.com>

#Installing/Updating OS level packages
RUN apt-get update -y; apt-get install fortune-mod cowsay netcat -y

#Creating application folder in container
RUN mkdir /opt/sampleapp-wisecow

#Copying sampleapp wisecow file to the container
COPY ./wisecow.sh /opt/sampleapp-wisecow

#Creating simlink for cowsay and fortune.
RUN ln -s /usr/games/cowsay /usr/bin/cowsay ; ln -s /usr/games/fortune /usr/bin/fortune

#Exposing default port
EXPOSE 4499

#Executing the sampleapp wisecow application
CMD ["sh","/opt/sampleapp-wisecow/wisecow.sh"]


