FROM tomcat:9.0

# Xóa các ứng dụng mẫu mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Thêm lệnh sed để vô hiệu hóa cổng shutdown
RUN sed -i 's/<Server port="8005"/<Server port="-1"/' /usr/local/tomcat/conf/server.xml

# Sửa lỗi 404: Sao chép file WAR từ thư mục 'dist' và đổi tên thành ROOT.war
# Tên file WAR của bạn là WebApplication1.war
COPY dist/WebApplication1.war /usr/local/tomcat/webapps/ROOT.war

# Dòng USER tomcat không cần thiết khi không dùng chown
# # Lệnh này sẽ chuyển đổi người dùng dùng chạy các lệnh tiếp theo ...
# USER tomcat 

EXPOSE 8080

ENV CATALINA_OPTS="-Djava.awt.headless=true --enable-native-access=ALL-UNNAMED"

# Khởi chạy Tomcat
CMD ["catalina.sh", "run"]