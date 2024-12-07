FROM tomcat:9-jdk11-openjdk-slim

WORKDIR /usr/local/tomcat/webapps

COPY target/my-webapp-null.war /usr/local/tomcat/webapps/my-webapp-null.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
