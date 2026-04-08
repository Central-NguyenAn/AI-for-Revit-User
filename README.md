<div align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Autodesk_Revit_2024_Icon.png/240px-Autodesk_Revit_2024_Icon.png" width="80" alt="Revit Logo">
  <h1>AI for Revit - Powered by Antigravity</h1>
  <p><strong>Giao tiếp, truy vấn và điều khiển mô hình Revit trực tiếp bằng Ngôn ngữ tự nhiên</strong></p>

  ![Revit Version](https://img.shields.io/badge/Revit-2023%20%7C%202024-0696D7?style=for-the-badge&logo=autodesk)
  ![Antigravity](https://img.shields.io/badge/Antigravity-Ready-8A2BE2?style=for-the-badge&logo=google)
  ![Gemini Flash](https://img.shields.io/badge/Powered_by-Gemini_Flash_|_Pro-FFC107?style=for-the-badge&logo=googlebard)
</div>

---

## 🌟 Giới thiệu

**AI for Revit** là hệ thống Plugin đột phá biến trải nghiệm làm việc với Revit trở nên đơn giản hơn bao giờ hết. Thay vì phải đau đầu click chuột qua hàng tỷ menu hoặc viết mã Dynamo phức tạp, bạn chỉ cần mở **Antigravity IDE** và *trò chuyện bằng tiếng Việt*.

Nhờ kiến trúc HTTP Bridge tối ưu hóa đặc biệt và tệp tri thức cục bộ (`.agent/openapi.json`), **Antigravity AI** sẽ lập tức phân tích yêu cầu, gửi Command siêu tốc độ xuống Revit, và trả lại kết quả trong nháy mắt (LLM Compact Mode).

---

## ⚡ Bắt đầu nhanh (Plug-and-Play)

Chỉ mất đúng 2 phút để thiết lập môi trường hội thoại với Revit của bạn.

### Bước 1: Khởi động Antigravity
**Antigravity** là không gian làm việc AI chính yếu của bạn.
1. Tải và cài đặt tại **[antigravity.google](https://antigravity.google)**.
2. Đăng nhập bằng tài khoản Google. (Nên bật **Agent Mode: Fast** và chọn model **Gemini Flash** để tiết kiệm tài nguyên mà vẫn đảm bảo tốc độ cực nhanh).

### Bước 2: Cài đặt Plugin vào Revit
1. Tải và giải nén thư mục `AI-for-Revit`.
2. Đóng Revit nếu đang mở.
3. Chạy tệp **`install.bat`** để tự động gắn Plugin vào hệ thống (Hỗ trợ Revit 2023/2024).

### Bước 3: Gắn kết AI và Mô hình
1. Mở Revit và tải một dự án (Project/Model).
2. Trở lại **Antigravity**, mở toàn bộ thư mục **`AI-for-Revit`** vừa giải nén (vào **File > Open Folder**). *Lưu ý: Bạn bắt buộc phải nạp thư mục này để AI nhận diện được tệp tri thức ngầm `.agent/`*.
3. Mở bảng AI Chat, gõ lệnh:
   > `/start`
4. Antigravity sẽ tự động kích hoạt tri thức, lấy API Map và bạn đã sẵn sàng trò chuyện!

---

## 🚀 Các tính năng cốt lõi (v2.0)

Hệ thống được thiết kế hoàn toàn riêng biệt (Tailor-made) cho Antigravity để xử lý khối lượng dữ liệu khổng lồ của Revit:

- **📊 Data Extraction & Schedules:** Đọc thông tin, xuất toàn bộ Bảng thống kê (Schedules), truy vấn Worksets, Links, Warnings.
- **🔍 Auto-Filter & Selection:** Tìm kiếm hàng nghìn đối tượng theo Category, Level, Parameter và highlight ngay lập tức trên màn hình Revit.
- **⚡ Macro Batch Update:** Gán/Sửa Parameter cho hàng nghìn đối tượng cùng lúc chỉ bằng một lệnh chat, không giới hạn tốc độ.
- **🔥 Lưới MEP & Sprinkler tiên tiến:** Truy vết hệ thống đường ống, đếm sprinkler hạ nguồn, kiểm tra vùng bao phủ lưới ngay trên không gian 3D.
- **🧠 LLM-Compact Mode:** Cấu trúc JSON trả về được nén tuyệt đối, giúp AI hiểu nhanh hơn gấp đôi, nói không với ảo giác (Hallucination).

---

## 💬 Gợi ý Prompt (Câu lệnh mẫu)

Ngay khi gõ `/start`, hãy thử ngay các câu thần chú sau bằng Tiếng Việt:

#### 1. Khám phá Mô hình
> *"Trong mô hình hiện tại có những Category nào? Có bao nhiêu cảnh báo (warnings)?"*  
> *"Liệt kê cho tôi thông tin của Dự án này và 10 worksets đầu tiên."*

#### 2. Chọn và Truy vấn chi tiết
> *"Tìm và chọn (highlight) tất cả các ống (Pipes) có đường kính (Diameter) lớn hơn 150mm."*  
> *"Đọc toàn bộ Parameter của Element ID 543210 cho tôi xem."*

#### 3. Chỉnh sửa siêu tốc (Batch API)
> *"Tìm tất cả Doors ở 'Tầng 1' và đổi tham số 'Comments' thành 'Đã kiểm tra'."*  
> *"Tăng giá trị 'Offset' của tất cả các Ống gió (Ducts) đang được chọn lên thêm 500mm."*

#### 4. Phân tích Chuyên sâu (MEP)
> *"Truy vết toàn bộ hệ thống nối với thiết bị (Mechanical Equipment) ID 98765."*  
> *"Kiểm tra vùng phủ của 5 đầu Sprinkler tôi đang chọn, có chỗ nào bị trống không?"*

---

## 🛠 Tài khoản và Hỗ trợ

Hệ thống hoạt động dựa trên hạn mức API của Google AI. Bạn có thể sử dụng hoàn toàn miễn phí hoặc nâng cấp để có sức mạnh cao hơn:

- **Bản Miễn phí (Gemini Flash):** Đủ dùng cho mục đích cơ bản, học tập. Khoảng 20-50 tác vụ/ngày.
- **Bản Google AI Pro / Ultra:** Tốc độ thần tốc, phù hợp làm việc dự án thực tế lớn. Mức token khổng lồ giúp quét Schedule cả chục nghìn dòng.

### AI không làm được yêu cầu của tôi?
Đừng lo! Nếu Antigravity không tìm thấy tool phù hợp để thực thi, AI sẽ **tự động phân tích lý do lỗi và gửi đề xuất** vào bộ nhớ lõi. Đội ngũ phát triển (Central-NguyenAn) sẽ cập nhật tính năng mới ở phiên bản tiếp theo.

---

<div align="center">
  <p><i>Được phát triển tinh gọn & tối ưu cho hệ sinh thái AI bởi <b>Central-NguyenAn</b>.</i></p>
</div>
