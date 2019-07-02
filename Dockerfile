FROM maven:3.6.1-jdk-11 as builder
WORKDIR /app
RUN apt-get install -y git
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-springboot-hello
WORKDIR boxfuse-sample-java-springboot-hello
RUN mvn clean package
#creating webserver
FROM tomcat:9.0.21-jdk11-openjdk-slim as runner
COPY --from=builder /app/boxfuse-sample-java-springboot-hello/target/hello.jar /usr/local/tomcat/webapps/
EXPOSE 8888