# Ứng dụng Video Call

Trong những năm trở lại đây, Internet đã trở thành thứ không thể thiếu trong
xã hội, giai đoạn sau năm 2010, đánh dấu sự bùng nổ của Smartphone không chỉ
ở Việt Nam mà cả thế giới. Bên cạnh đó, 2 năm trở lại đây, thế giới đã trải qua
một đại dịch lớn, làm thay đổi nhận thức của mọi người về hình thức trao đổi
thông tin trong công việc và cuộc sống, mở ra cơ hội cho Internet tiếp tục phát triển, đóng vai trò quan trọng hơn nữa trong cuộc sống thường nhật. Từ đó, nhu cầu trao đổi thông tin thông qua Internet đã trở nên cần thiết hơn bao giờ hết trong xã hội. Điều đó là tiền đề để nhóm chọn đề tài “Xây dựng ứng dụng Video Call” nhằm
giúp việc gặp gỡ, trao đổi online trở nên đơn giản, hiệu quả hơn. 

## Tính năng chính

- Thực hiện cuộc gọi nhóm
- Thực hiện cuộc gọi bạn bè
- Xem thông báo
- Quản lý thông tin cá nhân
- Đa ngôn ngữ
- Dark/light mode
- Đăng nhập, đăng ký, quên mật khẩu

## Công nghệ sử dụng

- Front-end: Dart, Flutter, BLoC, WebRTC
- Back-end: Golang, Redis, MongoDB

## Yêu cầu cài đặt

1. Front-end
- Phiên bản Flutter 3.7.12 (trong trường hợp sử dụng 3.10 trở lên, có thể cài đặt và sử dụng FVM tại `https://fvm.app/docs/getting_started/overview`)
2. Back-end
- Hướng dẫn cài đặt tham khảo tại `https://github.com/dinhlockt02/cs_video_call_app_server`

## Hướng dẫn cài đặt

- Bước 1: Clone sourcecode.
- Bước 2: Khởi tạo một project trong Firebase
- Bước 3: Sử dụng Firebase CLI để tích hợp vào Project, sau khi tích hợp thành công sẽ sinh ra file 'firebase_options.dart' ,đặt file này vào đúng folder 'lib/core/config'
- Bước 4: Chạy câu lệnh `flutter pub get` (trong trường hợp sử dụng fvm: `fvm flutter pub get`).
- Bước 5: Chạy tiếp câu lệnh `flutter packages pub run build_runner build --delete-conflicting-outputs` (trong trường hợp sử dụng fvm: `fvm flutter pub run build_runner build --delete-conflicting-outputs`).
- Bước 6: Trong file 'app_config.dart' (lib/core/config/app_config.dart) có thể tuỳ chỉnh biến httpUrl phù hợp với máy ảo hoặc máy thật sử dụng để chạy chương trình.
