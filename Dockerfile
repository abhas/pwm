FROM debian:latest 
MAINTAINER You "you@your.email"

# get the current package list
RUN apt-get -y update
RUN apt-get install -y bzip2 tomcat7 tomcat7-admin wget ca-certificates openjdk-7-jdk unzip
RUN wget --no-check-certificate https://doc-00-74-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/v5qertl16h231gtg5v0eia8426ndb15g/1409781600000/00610532175993983158/*/0B4acymQTOxqhb3V6OHU2T0pmRUk?h=16653014193614665626&e=download -O pwm.zip
RUN unzip pwm.zip

# expose ports 80 and 443 of this image to docker
EXPOSE :80
EXPOSE :443

# run this container until apache quits
CMD ["/root/init.sh"]

