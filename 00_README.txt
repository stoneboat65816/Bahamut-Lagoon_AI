=======Mã nguồn phần sửa lỗi font chữ bản dịch BAHAMUT LAGOON của Hali12===========

Bản dịch tiếng Việt của trò BAHAMUT LAGOON (Square Soft /1996/ Super Famicom) được bạn Hali12 dịch bằng AI (09/2026) có lỗi hiển thị chí mạng là chiều cao của font chữ không đủ để hiển thị hết phần dấu của các ký tự tiếng Việt.
Và đây là mã nguồn để khắc phục lỗi này.
Bạn chỉ cần click chuột là xong.

*** Cách thực hiện *** 

1) Tải folder mã nguồn này từ trang Github của thuyền đá, giải nén.
https://github.com/stoneboat65816?tab=repositories

2) Đưa bản ROM tiếng Việt của Hali12 vào folder có tên "BAHAMUT_ROM".

3) Đổi tên bản ROM tiếng Việt của Hali12 thành "00.sfc".

4) Quay ra folder gốc, double click vào file có tên:
◎"WINRUN.bat" nếu bạn dùng hệ điều hành Windows
◎"MACRUN_BAHAMUT.command" nếu bạn dùng hệ điều hành MAC. Trong trường hợp này, bạn cần có thêm ứng dụng WINE.

5) File "01.sfc" sẽ được tạo ra trong folder có tên "BAHAMUT_ROM". Đây chính là file được sửa lỗi font chữ.

* Chú ý: không can thiệp vào nội dung của file "Bahamut_main.asm" trong folder "BAHAMUT_ASM" nếu bạn không am hiểu ASM65816 và phần cứng của Super Famicom.

Mã nguồn này được cung cấp miễn phí.