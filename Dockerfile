FROM tomcat:9.0

# Xóa các ứng dụng mẫu mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Sao chép file WAR của bạn vào thư mục webapps
COPY *.war /usr/local/tomcat/webapps

# Mở cổng 8080
EXPOSE 8080

# Thêm đối số JVM để bật Native Access và loại bỏ cảnh báo
# CATALINA_OPTS được sử dụng để chứa các tùy chọn JVM bổ sung
ENV CATALINA_OPTS="-Djava.awt.headless=true --enable-native-access=ALL-UNNAMED"

# Khởi chạy Tomcat
CMD ["catalina.sh", "run"]