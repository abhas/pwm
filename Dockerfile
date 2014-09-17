FROM base/archlinux 
MAINTAINER You "you@your.email"
ADD pacman.conf /etc/pacman.conf
ADD mirrorlist /etc/pacman.d/mirrorlist
# get the current package list
RUN pacman -Suy --noconfirm
RUN pacman -S --noconfirm tomcat7  
ADD pwm.war /var/lib/tomcat7/webapps/pwm.war
ADD tomcat-users.xml /etc/tomcat7/tomcat-users.xml
#RUN mkdir /usr/share/tomcat7/temp
#RUN ln -s /etc/tomcat7/ /usr/share/tomcat7/conf
# expose ports 80 and 443 of this image to docker
EXPOSE :8080
# run this container until apache quits
CMD ["/usr/share/tomcat7/bin/catalina.sh", "run"]

