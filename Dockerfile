1 FROM maven:3.8.1-openjdk-17-slim AS builder
2 WORKDIR /DeployServletProject
3 COPY . .
4 RUN mvn clean package -DskipTests

5 FROM tomcat:9.0.108-jdk17-corretto
6 RUN rm -rf /usr/local/tomcat/webapps/* # /xóa mặc định của tomcat
7 COPY --from=builder /DeployServletProject/target/DeployServletProject-1.0.war /usr/local/tomcat/webapps/
8 EXPOSE 8080
9 CMD ["catalina.sh", "run"]