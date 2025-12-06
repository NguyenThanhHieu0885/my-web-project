# Sử dụng Image chính chủ của Composer
# Lý do: Image này đã CÓ SẴN PHP, Extension MySQL, Git, Zip...
# Bạn không cần chạy lệnh cài đặt nào thêm -> Tránh tuyệt đối lỗi mạng.
FROM composer:2

# Đặt thư mục làm việc là /app (Mặc định của image này)
WORKDIR /app

# Lệnh giữ cho container chạy (Khởi động Laravel Server ở cổng 8000)
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]