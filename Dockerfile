FROM tomcat:9.0

RUN rm -rf /usr/local/tomcat/webapps/*

# Sao chép file WAR
COPY *.war /usr/local/tomcat/webapps

# Thêm lệnh CHOWN để đảm bảo quyền thuộc về người dùng Tomcat
RUN chown -R tomcat:tomcat /usr/local/tomcat/webapps

EXPOSE 8080
ENV CATALINA_OPTS="-Djava.awt.headless=true --enable-native-access=ALL-UNNAMED"
CMD ["catalina.sh", "run"]