FROM tomcat:9.0

# Xóa các ứng dụng mẫu mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Thêm lệnh sed để vô hiệu hóa cổng shutdown
RUN sed -i 's/<Server port="8005"/<Server port="-1"/' /usr/local/tomcat/conf/server.xml

# Sao chép file WAR của bạn vào thư mục webapps
COPY *.war /usr/local/tomcat/webapps

# Lệnh này sẽ chuyển đổi người dùng chạy các lệnh tiếp theo (tuy nhiên, 
# trong trường hợp này, việc copy bằng root rồi chạy bằng tomcat thường vẫn ổn)
# USER tomcat 

EXPOSE 8080
ENV CATALINA_OPTS="-Djava.awt.headless=true --enable-native-access=ALL-UNNAMED"

# Khởi chạy Tomcat
CMD ["catalina.sh", "run"]