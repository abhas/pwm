FROM base/archlinux 
MAINTAINER You "you@your.email"
ADD pacman.conf /etc/pacman.conf
ADD mirrorlist /etc/pacman.d/mirrorlist
# get the current package list
RUN pacman -Suy --noconfirm
RUN pacman -S --noconfirm tomcat7 fastjar
RUN mkdir /pwm
ADD pwm.war /pwm/pwm.war
RUN cd /pwm && fastjar xvf pwm.war && rm -f /pwm/pwm.war
RUN mv /pwm /var/lib/tomcat7/webapps/pwm
ADD mysql-connector-java-5.1.32-bin.jar /var/lib/tomcat7/webapps/pwm/WEB-INF/lib/mysql-connector-java-5.1.32-bin.jar
ADD tomcat-users.xml /etc/tomcat7/tomcat-users.xml
#RUN mkdir /usr/share/tomcat7/temp
#RUN ln -s /etc/tomcat7/ /usr/share/tomcat7/conf
# expose ports 80 and 443 of this image to docker
EXPOSE :8080
# run this container until apache quits
CMD ["/usr/share/tomcat7/bin/catalina.sh", "run"]

