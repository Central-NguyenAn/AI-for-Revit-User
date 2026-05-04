<div align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Autodesk_Revit_2024_Icon.png/240px-Autodesk_Revit_2024_Icon.png" width="80" alt="Revit Logo">
  <h1>AI for Revit</h1>
  <p><strong>Công cụ giao tiếp, truy vấn và quản lý dữ liệu Revit thông qua ngôn ngữ tự nhiên</strong></p>

  ![Version](https://img.shields.io/badge/Version-2.0-blue?style=flat-square)
  ![Revit Version](https://img.shields.io/badge/Revit-2023%20%7C%202024-0696D7?style=flat-square&logo=autodesk)
  ![Antigravity](https://img.shields.io/badge/Antigravity-Integration-8A2BE2?style=flat-square&logo=google)
</div>

---

## 1. Tổng quan

**AI for Revit** là một giải pháp tích hợp (integration) chức năng kết nối phần mềm Autodesk Revit với môi trường Antigravity IDE (dựa trên VS Code). Hệ thống sử dụng kiến trúc HTTP Bridge cục bộ kết hợp cùng AI Agents để dịch ngữ nghĩa từ tiếng Việt thành các tập lệnh API thực thi trực tiếp trên mô hình Revit.

Cơ sở dữ liệu lệnh được đính kèm sẵn dưới dạng tệp cấu hình `.agent`, cho phép AI nhận diện phương thức giao tiếp mà không cần cấu hình phức tạp.

---

## 2. Hướng dẫn thiết lập

### 2.1 Cài đặt môi trường IDE
1. Tải và cài đặt Antigravity IDE tại **[antigravity.google](https://antigravity.google)**.
2. Đăng nhập hệ thống bằng tài khoản Google. (Khuyến nghị bật **Agent Mode: Fast** và sử dụng mô hình **Gemini Flash** để tối ưu thời gian phản hồi).

### 2.2 Cài đặt Revit Plugin
1. Đảm bảo phần mềm Revit đã được đóng.
2. Giải nén thư mục cài đặt `AI-for-Revit`.
3. Chạy tệp **`install.bat`** dưới quyền Administrator (Tuỳ chọn) để chép các tệp DLL vào thư mục Add-ins của hệ thống. Hỗ trợ phiên bản Revit 2023 và 2024.

### 2.3 Khởi tạo Workspace
1. Mở một dự án (.rvt) bất kỳ trong Revit.
2. Tại Antigravity IDE, chọn **File > Open Folder** và mở trình duyệt tới thư mục **`AI-for-Revit`** vừa giải nén. *Yêu cầu bắt buộc để Antigravity nhận dạng được thư mục `.agent/` chứa cấu hình.*
3. Mở bảng điều khiển Agent (Agent Panel), nhập lệnh khởi tạo:
   > `/start`
4. Hệ thống sẽ kết nối với Revit, nạp các tệp thiết lập và sẵn sàng nhận lệnh.

---

## 3. Chức năng hệ thống (v2.0)

### 3.1 Truy vấn & Thống kê
- **Data Extraction & Schedules:** Truy xuất tham số, trích xuất dữ liệu từ các Bảng thống kê (Schedules), truy vấn thông tin Worksets, Links và Warnings nội tại.
- **Selection & Filtering:** Tìm kiếm đối tượng dựa trên Category, Level, hoặc các tham số kỹ thuật (Parameter conditions) cụ thể và chọn (highlight) trực tiếp trong môi trường 3D.
- **Distance Measurement:** Đo khoảng cách 2D/3D giữa 2 đối tượng đang được chọn trong mô hình.

### 3.2 Batch Parameter Update *(Mới v2.0)*
- **Filter & Set Parameter (All-in-one):** Tìm + lọc + gán parameter trong 1 lần gọi API. Hỗ trợ `dryRun` để xem trước trước khi gán thật.
- **BoundingBox Level Filter:** Quét tất cả đối tượng 3D nằm giữa 2 Level (bằng BoundingBox), nhóm theo Category, và gán parameter hàng loạt — giống chức năng FloorParameterAssigner.
- **Bulk Set Parameter:** Ghi/đè tham số cho hàng loạt Element ID chỉ với một lệnh.

### 3.3 MEP Analysis
- **Network Tracing:** Truy vết mạng lưới kết nối của hệ thống Cơ Điện (MEP).
- **Sprinkler Analysis:** Kiểm tra số lượng Sprinkler hạ nguồn trên từng ống, đối soát với bảng quy định đường kính.
- **Coverage Check:** Phân tích vùng bao phủ an toàn của Sprinkler bằng grid-based sampling.

### 3.4 LLM-Compact Data
- Kết xuất dữ liệu JSON ở cấu trúc cô đọng (loại bỏ Null và ký tự định dạng) để tương thích với giới hạn bộ nhớ (Context Window) của LLM.

---

## 4. Tham gia lệnh (Prompts)

Dưới đây là một số cú pháp tham khảo để kiểm thử hệ thống:

**Truy vấn dữ liệu:**
> *"Liệt kê danh sách các Category đang có trong dự án và đếm số lượng warning hiện tại."*  
> *"Đọc và xuất dữ liệu từ bảng thống kê 'Pipe Schedule'."*

**Xử lý tham số:**
> *"Tìm tất cả Pipes thuộc Tầng 1 có Diameter lớn hơn 100mm."*  
> *"Gán tham số 'Comments' thành 'Tested' cho toàn bộ Doors tại Tầng 2."*

**Quét theo Level (v2.0):**
> *"Quét tất cả đối tượng giữa Level 1 và Level 2, cho tôi xem có gì."*  
> *"Gán TANG = 'Tầng 1' cho tất cả Walls và Columns giữa Level 1 và Level 2."*

**Phân tích MEP:**
> *"Truy vết và xuất danh sách các phần tử kết nối với Mechanical Equipment có ID 123456."*  
> *"Kiểm tra độ che phủ của các vùng lưới đối với các Sprinkler đang được chọn."*

---

## 5. Changelog

### v2.0 (04/05/2026)
- ✅ **Filter & Set Parameter (All-in-one):** Endpoint mới gộp tìm + lọc + gán parameter, hỗ trợ `dryRun`
- ✅ **Assign Parameter Between Levels:** Quét elements 3D giữa 2 Level bằng BoundingBox filter
- ✅ **Measure Distance:** Đo khoảng cách 2D/3D giữa 2 elements đang chọn
- ✅ **Selected Elements Summary:** Thống kê chi tiết elements đang chọn theo category/type
- ✅ **Sprinkler Coverage Check:** Phân tích vùng bao phủ bằng grid sampling
- ✅ **MEP Pipe-Sprinkler Count:** Đếm sprinkler downstream + kiểm tra quy cách đường kính

### v1.0
- Phiên bản đầu tiên: truy vấn elements, parameters, views, schedules, warnings, worksets, links
- Selection & Find-and-Select
- Bulk parameter set

---

## 6. Giới hạn sử dụng

Plugin vận hành thông qua các lệnh gọi API tới Google Gemini (thông qua tài khoản Antigravity). Hiệu suất có giới hạn theo phân hạng tài khoản:
- **Tài khoản Google miễn phí (Gemini Flash):** ~20-50 tác vụ/ngày. Đủ đáp ứng các thao tác truy vấn độc lập và xử lý tham số quy mô nhỏ.
- **Tài khoản Google AI Pro/Ultra:** Hỗ trợ quy trình làm việc liên tục với giới hạn Token lớn, phù hợp khi cần đọc bảng thống kê dữ liệu lớn.

### Ghi chú lỗi nội bộ:
Khi một yêu cầu vượt ngoài phạm vi của các Tool khả dụng hiện tại, quá trình sinh lỗi sẽ được ghi nhận vào `lesson_learned.md`. Nhà phát triển (Central-NguyenAn) sẽ cập nhật và bổ sung Handler mới vào thư viện C# dựa trên những logs này nếu cần thiết.

---

<div align="center">
  <p><i>Phát triển bởi <b>Central-NguyenAn</b>.</i></p>
</div>
