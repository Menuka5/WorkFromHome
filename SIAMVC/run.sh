#! /bin/bash

shutdown.sh;
mvn clean install;
rm -r ~/Software/apache-tomcat-8.0.32/webapps/SIAMVC;
rm ~/Software/apache-tomcat-8.0.32/webapps/SIAMVC.war;
mv /home/hsenid/Tutorials/SIAMVC/target/SIAMVC.war ~/Software/apache-tomcat-8.0.32/webapps;
startup.sh;
