FROM tomcat:9.0

# Xóa các ứng dụng mẫu mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# 🚀 BƯỚC MỚI: Vô hiệu hóa cổng Shutdown (8005) 
# Điều này loại bỏ cảnh báo "Invalid shutdown command"
RUN sed -i 's/<Server port="8005"/<Server port="-1"/' /usr/local/tomcat/conf/server.xml

# Sao chép file WAR của bạn vào thư mục webapps
COPY *.war /usr/local/tomcat/webapps

# Mở cổng 8080
EXPOSE 8080

# Thêm đối số JVM để bật Native Access (khắc phục cảnh báo trước)
ENV CATALINA_OPTS="-Djava.awt.headless=true --enable-native-access=ALL-UNNAMED"

# Khởi chạy Tomcat
CMD ["catalina.sh", "run"]