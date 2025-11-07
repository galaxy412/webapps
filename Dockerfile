# GIAI ĐOẠN 1: BUILD PROJECT (Sử dụng Image Maven)
FROM maven:3.8.1-openjdk-17-slim AS builder
# WORKDIR /WebApplication1 # Không nên dùng tên project, dùng đường dẫn chung là tốt nhất
WORKDIR /app
COPY . . # Sao chép toàn bộ mã nguồn
# Lệnh này sẽ build project và tạo ra file .war trong thư mục 'target'
RUN mvn clean package -DskipTests

# --------------------------------------------------------------------------------

# GIAI ĐOẠN 2: CHẠY ỨNG DỤNG (Sử dụng Image Tomcat)
FROM tomcat:10.1-jdk17-corretto

# Xóa ứng dụng mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Sao chép file .war từ Giai đoạn 1 vào thư mục webapps của Tomcat
# ⚠️ CẦN CHỈNH SỬA DÒNG NÀY ⚠️
# Thay thế tên file bên dưới bằng tên thực tế của file .war của bạn.
# Tên file thường là: <artifactId>-<version>.war (ví dụ: WebApplication1-1.0-SNAPSHOT.war)
# Bạn nên đổi tên thành ROOT.war để ứng dụng chạy ở URL gốc (http://localhost:8080/)

# CÚ PHÁP: COPY --from=<tên_giai_đoạn_build> <đường_dẫn_file_trong_builder> <đường_dẫn_trong_tomcat>
COPY --from=builder /app/target/WebApplication1.war /usr/local/tomcat/webapps/ROOT.war

# Mở cổng mặc định của Tomcat
EXPOSE 8080

# Lệnh chạy Tomcat khi container khởi động
CMD ["catalina.sh", "run"]