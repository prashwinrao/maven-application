FROM tomcat:9-jdk11-openjdk-slim
WORKDIR /usr/local/tomcat/webapps
ARG BUILD_NUMBER
COPY target/my-webapp-${BUILD_NUMBER}.war /usr/local/tomcat/webapps/my-webapp.war
EXPOSE 8080
CMD ["catalina.sh", "run"]

