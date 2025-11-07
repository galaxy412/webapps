FROM tomcat:9.0.108-jdk17-corretto

# Xóa các ứng dụng mặc định (ROOT)
RUN rm -rf /usr/local/tomcat/webapps/*

# Thay đổi đường dẫn COPY: Lấy file từ thư mục 'dist/'
# Đường dẫn: dist/WebApplication1.war (so với thư mục gốc dự án)
COPY dist/WebApplication1.war /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]