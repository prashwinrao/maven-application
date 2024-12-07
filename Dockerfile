FROM tomcat:9-jdk11-openjdk-slim
WORKDIR /usr/local/tomcat/webapps
COPY ./target/my-webapp-${env.BUILD_NUMBER}.war /usr/local/tomcat/webapps/my-webapp-${env.BUILD_NUMBER}.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
