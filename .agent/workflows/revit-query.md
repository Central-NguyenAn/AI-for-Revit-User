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
| Ẩn/hiện Revit Links trong view | `/api/views/toggle-links` | POST, body: `{"action":"hide/show/toggle"}` |
| Warnings | `/api/warnings` | GET |
| Worksets | `/api/worksets` | GET |
| Thống kê elements theo Worksets | `/api/worksets/detail` | GET |
| Revit Links | `/api/linked-models` | GET |
| Danh sách Grids + Tọa độ | `/api/grids` | GET |
| Danh sách Levels + Cao độ chi tiết | `/api/levels/detail` | GET |
| Phân tích unused View Templates/Filters/Worksets | `/api/purge/analysis` | GET |
| Danh sách Schedules | `/api/schedules` | GET |
| Xuất dữ liệu Schedule | `/api/schedule/{name}` | GET |
| Chọn elements | `/api/elements/select` | POST, body: `{"elementIds":[...]}` |
| Elements đang chọn | `/api/elements/selected` | GET |
| Thống kê elements đang chọn | `/api/elements/selected/summary` | GET |
| Tìm và chọn elements | `/api/elements/find-and-select` | POST, body: `{"category":"..."}` |
| Khoảng cách 2 elements đang chọn | `/api/elements/selected/distance` | GET |
| Kiểm tra bao phủ sprinkler (chọn trước) | `/api/sprinklers/coverage-check` | POST, body: `{"cellSize":0.5,"autoSelect":true}` |
| Truy vết kết nối hệ thống MEP | `/api/mep/connected-elements` | POST, body: `{"elementIds":[...],"maxDepth":100}` |
| Đếm sprinkler trên từng ống + kiểm tra đường kính | `/api/mep/pipe-sprinkler-count` | POST, body: `{"useSelection":true,"diameterRules":[...]}` |
| Set parameter hàng loạt | `/api/elements/set-parameter-bulk` | POST, body: `{"changes":[{"elementId":...,"parameterName":"...","value":"..."}]}` |
| Set parameter theo level | `/api/elements/set-parameter-by-level` | POST, body: `{"category":"...","parameterName":"...","rules":[{"levels":["..."],"value":"..."},{"levels":["*"],"value":"..."}]}` |
| Tìm + Gán parameter (all-in-one) | `/api/elements/filter-and-set-parameter` | POST, body: `{"category":"...","levels":["..."],"parameterName":"...","value":"...","dryRun":true}` |
| Gán parameter theo BoundingBox giữa 2 Level (FloorParameterAssigner) | `/api/elements/assign-parameter-between-levels` | POST, body: `{"lowerLevelName":"...","upperLevelName":"...","categories":["Walls","Doors"],"parameterName":"TANG","value":"TẦNG 1","dryRun":true}` |

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
- "Thay đổi parameter" → Xem **mục 7. Quy trình gán tham số** bên dưới
- "Cho tui xem schedule X" → `GET /api/schedules` để tìm tên → `GET /api/schedule/{name}`
- "Tôi đang mở view nào?" → `GET /api/active-view`

### 6. Quy tắc quan trọng
- **Luôn dùng `statistics.sum` hoặc `grandTotal`** từ kết quả API — KHÔNG tự cộng
- **Xác nhận trước khi thay đổi** (set parameter) — luôn hỏi user trước khi gán
- Nếu element nhiều, tóm tắt và hỏi user muốn xem chi tiết không
- Nếu user yêu cầu tính năng chưa có (tạo, xóa, di chuyển...) → thông báo chưa hỗ trợ
- **KHÔNG dùng `set-parameter-by-level`** — endpoint này bị lỗi encoding Unicode tiếng Việt trong PowerShell (tên tầng `TẦNG` → `T?NG`)
- **Luôn dùng `set-parameter-bulk`** kết hợp với danh sách element ID đã lọc trước (xem mục 7)

### 7. Quy trình gán tham số (SET PARAMETER) — BẮT BUỘC
Khi user yêu cầu gán/thay đổi parameter cho nhiều elements, **LUÔN** dùng endpoint all-in-one `filter-and-set-parameter`:

**Bước 1: Dry-run — tìm và đếm elements (KHÔNG gán)**
// turbo
```
Invoke-RestMethod -Uri "http://localhost:8080/api/elements/filter-and-set-parameter" -Method POST -ContentType "application/json; charset=utf-8" -Body ([System.Text.Encoding]::UTF8.GetBytes('{"category":"<CATEGORY>","levels":["<TẦNG 1>","<TẦNG 2>"],"parameterName":"<PARAM>","value":"<VALUE>","dryRun":true}')) -TimeoutSec 120 | ConvertTo-Json -Depth 5
```
→ Báo kết quả cho user (bao nhiêu elements, ở đâu) → Xác nhận trước khi tiếp tục.

**Bước 2: Apply — gán parameter thật**
// turbo
```
Invoke-RestMethod -Uri "http://localhost:8080/api/elements/filter-and-set-parameter" -Method POST -ContentType "application/json; charset=utf-8" -Body ([System.Text.Encoding]::UTF8.GetBytes('{"category":"<CATEGORY>","levels":["<TẦNG 1>","<TẦNG 2>"],"parameterName":"<PARAM>","value":"<VALUE>","dryRun":false}')) -TimeoutSec 120 | ConvertTo-Json -Depth 5
```

**Lưu ý:**
- Luôn dùng `[System.Text.Encoding]::UTF8.GetBytes()` để tránh lỗi encoding Unicode
- `levels` có thể bỏ trống nếu muốn gán cho TẤT CẢ elements trong category
- Hỗ trợ thêm `filter` (lọc theo tên) và `conditions` (lọc theo parameter)
- **KHÔNG dùng cách cũ** (query elements → lấy ID → gọi set-parameter-bulk) vì quá chậm

