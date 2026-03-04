# 🤖 AI for Revit

**Trợ lý AI thông minh giúp bạn truy vấn và phân tích mô hình Revit bằng ngôn ngữ tự nhiên.**

Chỉ cần mô tả yêu cầu — AI sẽ tự động truy vấn dữ liệu từ mô hình Revit và trả kết quả ngay trong editor.

---

## ✨ Tính năng hiện có

| Nhóm | Tính năng | Ví dụ câu hỏi |
|:---|:---|:---|
| **📊 Thống kê** | Đếm, tổng hợp, nhóm theo type | "Thống kê số lượng ống theo loại" |
| **🔍 Truy vấn** | Lọc elements theo category, type, parameter | "Liệt kê tất cả ống có kích thước DN100" |
| **📋 Schedule** | Đọc và xuất dữ liệu schedule | "Cho tôi xem schedule Pipe Schedule" |
| **📐 Parameters** | Đọc/ghi parameter của element | "Đọc parameters của element ID 12345" |
| **🏷️ Categories** | Liệt kê categories trong mô hình | "Trong mô hình có những category nào?" |
| **👆 Selection** | Thao tác với elements đang chọn | "Thống kê phụ kiện trong các đối tượng đang chọn" |
| **⚠️ Warnings** | Kiểm tra cảnh báo mô hình | "Mô hình có bao nhiêu warnings?" |
| **📁 Worksets** | Kiểm tra worksets | "Liệt kê các worksets trong dự án" |
| **🔗 Links** | Thông tin Revit Links | "Có những linked model nào?" |
| **🏗️ Views/Sheets** | Danh sách Views/Sheets, xác định view hiện hành | "Tôi đang mở view nào?" |
| **ℹ️ Project Info** | Thông tin dự án | "Thông tin dự án đang mở là gì?" |

### Categories hỗ trợ
Walls, Floors, Columns, Structural Framing, Ducts, Duct Fittings, Pipes, Pipe Fittings, Cable Trays, Cable Tray Fittings, Conduits, Conduit Fittings, Mechanical Equipment, Sprinklers, Doors, Windows, Rooms, Ceilings, Stairs, Railings, Generic Models, Furniture, Grids, Levels.

---

## 🚀 Cài đặt

### Bước 1: Cài đặt Antigravity (IDE)

Antigravity là IDE (trình soạn thảo code) tích hợp AI, dựa trên VS Code.

1. Truy cập **[antigravity.google](https://antigravity.google)** 
2. Tải bản cài đặt cho Windows
3. Chạy file cài đặt và làm theo hướng dẫn
4. Khi khởi động lần đầu, **đăng nhập bằng tài khoản Google** của bạn
5. Chọn theme (giao diện) yêu thích

> 💡 **Tip**: Nếu bạn đã dùng VS Code, chọn "Import from Visual Studio Code" để giữ lại các cài đặt cũ.

### Bước 2: Cài đặt Plugin Revit

1. Giải nén (hoặc mở) folder **AI-for-Revit**
2. **Double-click vào `install.bat`** — script sẽ tự động copy plugin vào Revit
3. Hỗ trợ **Revit 2023** và **Revit 2024**

> ⚠️ **Lưu ý**: Đóng Revit trước khi chạy install.bat nếu đang mở.

### Bước 3: Bắt đầu sử dụng

1. Mở **folder `AI-for-Revit`** trong Antigravity (File → Open Folder)
2. Mở cửa sổ chat (Agent panel)
3. Gõ **`/start`** → AI sẽ nạp tri thức và kiểm tra kết nối Revit
4. Bắt đầu đặt yêu cầu bằng tiếng Việt! 🎉

---

## 💎 Tài khoản Gemini — So sánh các gói

AI for Revit sử dụng Gemini AI thông qua tài khoản Google của bạn. **Thời lượng truy vấn phụ thuộc vào loại tài khoản:**

| | **🆓 Free** | **💳 Google AI Pro ($20/tháng)** | **👑 Google AI Ultra ($250/tháng)** |
|:---|:---:|:---:|:---:|
| **Model chính** | Gemini Flash | Gemini Pro + Flash | Gemini Pro + Flash |
| **Số truy vấn/ngày** | ~20–50 | ~100–1,500 | ~500–1,500 |
| **Tốc độ phản hồi** | Bình thường | Nhanh | Nhanh nhất |
| **Phù hợp** | Dùng thử, ít truy vấn | Dùng hàng ngày | Dùng chuyên sâu |

> 📝 **Ghi chú**: Số truy vấn thực tế có thể thay đổi tùy theo chính sách Google.

---

## ⚡ Cài đặt khuyến nghị — Tối ưu tốc độ

Để có **trải nghiệm nhanh nhất** và **tiết kiệm quota**, hãy cấu hình trong Antigravity:

### 1. Chọn chế độ Fast
- Mở **Settings** trong Antigravity
- Tìm mục **Agent Mode** hoặc **Speed**
- Chọn **Fast** thay vì Standard/Thorough

### 2. Chọn model Gemini Flash
- Trong cửa sổ chat, chọn model: **Gemini Flash** (thay vì Gemini Pro)
- Flash nhanh hơn 2-3x và tiêu tốn ít quota hơn
- Đủ mạnh cho hầu hết các truy vấn Revit

> 💡 **Khi nào dùng Gemini Pro?** Chỉ khi cần phân tích phức tạp (thống kê nhiều bước, so sánh dữ liệu lớn). Các truy vấn thông thường dùng Flash là đủ.

---

## 📖 Hướng dẫn sử dụng

### Khởi động (mỗi lần mở Antigravity mới)
```
/start
```
AI sẽ nạp tri thức và kiểm tra kết nối Revit.

### Ví dụ truy vấn

**Thống kê:**
```
Thống kê tổng chiều dài ống theo loại
Đếm số lượng duct fittings trong mô hình
Liệt kê khối lượng phụ kiện đang chọn
```

**Truy vấn cụ thể:**
```
Cho tôi xem parameters của element ID 123456
Tìm tất cả ống có đường kính lớn hơn DN200
Liệt kê tất cả views trong dự án
Tôi đang mở view nào? / View hiện tại là gì?
```

**Thao tác:**
```
Chọn (highlight) tất cả Pipe Fittings trong mô hình
Trong mô hình có bao nhiêu warnings?
Workset nào đang trống?
```

**Schedule:**
```
Liệt kê các schedule có trong mô hình
Cho tôi xem dữ liệu schedule "Pipe Schedule"
```

### Lưu ý quan trọng
- Luôn gõ `/start` khi mở cửa sổ chat mới
- Revit phải đang mở và model đã load
- AI trả lời bằng **tiếng Việt**
- Nếu AI không thực hiện được yêu cầu, nó sẽ **tự động gửi yêu cầu cho đội phát triển** để cập nhật tính năng

---

## 🔧 Yêu cầu hệ thống

| Thành phần | Yêu cầu |
|:---|:---|
| **Revit** | 2023 hoặc 2024 |
| **Hệ điều hành** | Windows 10/11 (64-bit) |
| **IDE** | Antigravity (tải tại [antigravity.google](https://antigravity.google)) |
| **Tài khoản** | Google account (Free hoặc trả phí) |
| **Kết nối mạng** | Cần internet để gọi AI |

---

## ❓ FAQ

**Q: AI có thể sửa/thêm/xóa elements trong mô hình không?**  
A: Hiện tại AI có thể **đọc** và **set parameter** cho elements. Chưa hỗ trợ tạo mới hoặc xóa elements.

**Q: Tôi muốn AI làm thêm tính năng X thì sao?**  
A: Cứ yêu cầu AI! Nếu tính năng chưa có, AI sẽ tự động ghi nhận và gửi yêu cầu cho đội phát triển.

**Q: Dữ liệu mô hình có bị gửi ra ngoài không?**  
A: Dữ liệu được xử lý **local trên máy bạn**. Chỉ câu hỏi và kết quả truy vấn được gửi tới Gemini AI để phân tích.

**Q: Plugin có xung đột với addon khác không?**  
A: Không. Plugin hoạt động độc lập, không can thiệp vào các addon khác.

---

*Phát triển bởi Central-NguyenAn • Phiên bản 1.0*
