---
description: Query Revit model bằng ngôn ngữ tự nhiên - User Flow (không hiện lệnh HTTP)
---

# Revit Query - User Flow

Workflow này cho phép Antigravity tương tác với Revit model thông qua RevitBridge HTTP API.
User chỉ cần nói yêu cầu bằng ngôn ngữ tự nhiên, Antigravity tự gọi API và trả kết quả đẹp.

## Yêu cầu
- Revit đang mở và plugin RevitBridge đã load (HTTP server chạy trên port 8080)

## Quy trình

### 1. Kiểm tra kết nối
// turbo
Trước tiên luôn kiểm tra RevitBridge có online không:
```
Invoke-RestMethod -Uri "http://localhost:8080/api/health" -TimeoutSec 10
```
Nếu lỗi → thông báo user cần mở Revit và load plugin.

### 2. Phân tích yêu cầu của user
Dựa trên câu hỏi, chọn endpoint phù hợp:

| Yêu cầu | Endpoint | Method |
|----------|----------|--------|
| Thông tin dự án | `/api/project-info` | GET |
| Danh sách categories | `/api/categories` | GET |
| Truy vấn elements | `/api/elements` | POST, body: `{"category":"...","limit":100}` |
| Đọc parameters 1 element | `/api/element/{id}/parameters` | GET |
| Set parameter | `/api/element/{id}/parameters` | POST, body: `{"parameterName":"...","value":"..."}` |
| Trích xuất 1 parameter nhiều elements | `/api/elements/parameter` | POST, body: `{"category":"...","parameterName":"..."}` |
| Thống kê nhóm theo type | `/api/elements/summary` | POST, body: `{"category":"...","parameterName":"..."}` |
| Danh sách Views/Sheets | `/api/views` | GET |
| View hiện hành đang mở | `/api/active-view` | GET |
| Warnings | `/api/warnings` | GET |
| Worksets | `/api/worksets` | GET |
| Revit Links | `/api/linked-models` | GET |
| Danh sách Schedules | `/api/schedules` | GET |
| Xuất dữ liệu Schedule | `/api/schedule/{name}` | GET |
| Chọn elements | `/api/elements/select` | POST, body: `{"elementIds":[...]}` |
| Elements đang chọn | `/api/elements/selected` | GET |
| Thống kê elements đang chọn | `/api/elements/selected/summary` | GET |
| Tìm và chọn elements | `/api/elements/find-and-select` | POST, body: `{"category":"..."}` |
| Khoảng cách 2 elements đang chọn | `/api/elements/selected/distance` | GET |
| Kiểm tra bao phủ sprinkler (chọn trước) | `/api/sprinklers/coverage-check` | POST, body: `{"cellSize":0.5}` |

### 3. Gọi API bằng curl
// turbo
Sử dụng `run_command` với `Invoke-RestMethod` để gọi RevitBridge. Ví dụ:

**GET requests:**
```
Invoke-RestMethod -Uri "http://localhost:8080/api/project-info" -TimeoutSec 30
```

**POST requests:**
```
Invoke-RestMethod -Uri "http://localhost:8080/api/elements" -Method POST -ContentType "application/json" -Body '{"category":"Pipes","limit":100}' -TimeoutSec 30 | ConvertTo-Json -Depth 10
```

### 4. Format kết quả
- Parse JSON response
- Trình bày kết quả bằng **ngôn ngữ tự nhiên**, dạng bảng markdown nếu phù hợp
- **KHÔNG hiển thị lệnh curl** cho user
- **KHÔNG hiển thị raw JSON** trừ khi user yêu cầu
- Nếu có thống kê số liệu, dùng bảng markdown
- Luôn trả lời bằng **tiếng Việt**

### 5. Xử lý nhiều bước
Một số yêu cầu cần nhiều API call:
- "Tổng chiều dài ống" → `POST /api/elements/summary` với `{"category":"Pipes","parameterName":"Length"}`
- "Danh sách ống theo loại" → `POST /api/elements/summary`
- "Thay đổi parameter" → Xác nhận với user trước → `POST /api/element/{id}/parameters`
- "Cho tui xem schedule X" → `GET /api/schedules` để tìm tên → `GET /api/schedule/{name}`
- "Tôi đang mở view nào?" → `GET /api/active-view`

### 6. Quy tắc quan trọng
- **Luôn dùng `statistics.sum` hoặc `grandTotal`** từ kết quả API — KHÔNG tự cộng
- **Xác nhận trước khi thay đổi** (set_element_parameter)
- Nếu element nhiều, tóm tắt và hỏi user muốn xem chi tiết không
- Nếu user yêu cầu tính năng chưa có (tạo, xóa, di chuyển...) → thông báo chưa hỗ trợ
