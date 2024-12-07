FROM tomcat:9-jdk11-openjdk-slim

# Set the working directory
WORKDIR /usr/local/tomcat/webapps

# Define a build-time argument for the build number
ARG BUILD_NUMBER

# Use the build number in the WAR file name
COPY target/my-webapp-${BUILD_NUMBER}.war /usr/local/tomcat/webapps/my-webapp.war

# Expose the port
EXPOSE 8080

# Command to run Tomcat
CMD ["catalina.sh", "run"]

