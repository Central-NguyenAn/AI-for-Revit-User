# AI for Revit — Tài liệu Tổng hợp Khả năng

**Phiên bản:** 2.1 | **Cập nhật:** 02/03/2026  
**Model AI:** Gemini 2.5 Flash | **Ngôn ngữ:** Tiếng Việt & Tiếng Anh

---

## Kiến trúc Hệ thống

Hệ thống hỗ trợ **2 chế độ hoạt động** song song:

### Chế độ 1: AI Chat tích hợp trong Revit (Chính)

```
👤 User ←→ 🏗️ AI Chat DockablePane (WPF, C#)
                     ↕
              🤖 Gemini API (REST, gọi trực tiếp từ C#)
                     ↕
              🔧 ToolExecutor → Handlers (gọi nội bộ, không qua HTTP)
                     ↕
              📐 Revit API (mô hình BIM)
```

- Nhúng trực tiếp vào Revit dưới dạng **DockablePane**
- Giao tiếp Gemini API bằng `HttpClient` (C#), **không cần Python**
- Gọi handler nội bộ qua `ToolExecutor` — nhanh hơn, không cần HTTP server

### Chế độ 2: Python AI Gateway (Bổ sung / Dev)

```
👤 User ←→ 🐍 Python AI Gateway (chat.py) ←→ 🤖 Gemini API
                     ↕
              � HTTP Client
                     ↕
              �🏗️ RevitBridge HTTP Server (localhost:8080)
                     ↕
              📐 Revit API (mô hình BIM)
```

- CLI chat qua terminal
- Gọi RevitBridge qua HTTP (`localhost:8080`)
- Phù hợp để dev/test hoặc tích hợp bên ngoài

---

## Danh sách 17 Tools

### 1. Truy vấn Dự án

| Tool | Mô tả |
|---|---|
| `get_project_info` | Tên dự án, đường dẫn file, phiên bản Revit |
| `get_categories` | Liệt kê tất cả categories có element trong mô hình |

**Ví dụ câu hỏi:**
- "Dự án này tên gì?"
- "Mô hình có những loại đối tượng nào?"

---

### 2. Truy vấn Elements

| Tool | Mô tả |
|---|---|
| `get_elements` | Tìm elements theo category, lọc theo tên/type name |
| `get_element_parameters` | Đọc tất cả parameters của 1 element |
| `set_element_parameter` | Cập nhật giá trị parameter ⚠️ |

**Ví dụ câu hỏi:**
- "Liệt kê tất cả ống CDD"
- "Ống ID 7391236 có những tham số gì?"
- "Đổi Mark của ống 7391236 thành 'ABC-001'"

---

### 3. Thống kê & Tính toán

| Tool | Mô tả |
|---|---|
| `get_elements_parameter` | Trích xuất 1 parameter từ nhiều elements (có statistics: sum/min/max/avg) |
| `get_elements_summary` | **Nhóm theo Type Name** + tính tổng — giống Revit Schedule. Hỗ trợ **conditions** (`Width < 400`) |

**Ví dụ câu hỏi:**
- "Tổng chiều dài tất cả ống trong mô hình?"
- "Tổng chiều dài ống gió TDF Flange có bề rộng nhỏ hơn 400?"
- "Bao nhiêu ống CDD có đường kính lớn hơn 100?"
- "So sánh chiều dài các loại ống theo type?"

**Tính năng conditions:**
```
Operators hỗ trợ: =, !=, <, >, <=, >=, contains
Ví dụ: Width < 400, Diameter >= 100, Comments contains "CDD"
```

---

### 4. Views & Sheets

| Tool | Mô tả |
|---|---|
| `get_views` | Liệt kê Views/Sheets, nhóm theo loại (FloorPlan, Section, 3D...) |

**Ví dụ câu hỏi:**
- "Mô hình có bao nhiêu view?"
- "Có bao nhiêu sheet?"
- "Liệt kê các view 3D"

---

### 5. Quản lý Mô hình

| Tool | Mô tả |
|---|---|
| `get_warnings` | Đọc warnings/errors, nhóm theo loại |
| `get_worksets` | Liệt kê worksets (workshared models) |
| `get_linked_models` | Liệt kê Revit Links |

**Ví dụ câu hỏi:**
- "Mô hình có bao nhiêu lỗi?"
- "Lỗi nào xuất hiện nhiều nhất?"
- "Có những file link nào?"
- "Workset nào đang mở?"

---

### 6. Schedules

| Tool | Mô tả |
|---|---|
| `get_schedules` | Liệt kê tất cả Schedules |
| `export_schedule` | Xuất dữ liệu Schedule ra JSON — **chính xác nhất** |

**Ví dụ câu hỏi:**
- "Có những schedule nào trong mô hình?"
- "Đọc dữ liệu từ Pipe Schedule 2"
- "Tổng chiều dài ống trong Duct Schedule là bao nhiêu?"

---

### 7. Tương tác UI

| Tool | Mô tả |
|---|---|
| `select_elements` | Chọn (highlight) elements trong Revit theo danh sách Element IDs |
| `get_selected_elements` | Lấy danh sách Element IDs đang được chọn trong Revit |
| `find_and_select_elements` | ⚡ Tìm + chọn elements cùng lúc (nhanh hơn, gộp 2 bước thành 1) |

**Ví dụ câu hỏi:**
- "Tìm tất cả ống CDD và chọn chúng trong mô hình"
- "Highlight các ống có đường kính lớn hơn 200"
- "Tôi đang chọn mấy đối tượng trong Revit?"

---

### 8. Phản hồi & Feedback

| Tool | Mô tả |
|---|---|
| `report_feature_request` | Ghi nhận yêu cầu tính năng mà AI chưa hỗ trợ → gửi cho team phát triển |

- AI tự động gọi tool này khi người dùng yêu cầu tính năng ngoài khả năng hiện tại
- Lưu local tại `%APPDATA%/RevitBridge/feature_requests.json`
- Gửi webhook tới Google Sheets (nếu đã cấu hình)

---

## Tối ưu Hiệu suất (v2.1)

| Tối ưu | Hiệu quả |
|---|---|
| **Gộp tool `find_and_select_elements`** | Giảm 3 → 2 round-trip API, tiết kiệm ~2-5 giây mỗi thao tác tìm+chọn |
| **Trim history** (max 20 entries) | Tránh payload ngày càng lớn, giữ tốc độ ổn định khi chat dài |
| **Compact tool results** (max 2000 chars) | Gửi ít data hơn cho Gemini, giảm thời gian xử lý |
| **Streaming response** | Text hiển thị realtime từng phần, UX mượt hơn |

---

## Hạn chế Hiện tại

| Hạn chế | Lý do | Hướng xử lý |
|---|---|---|
| Không tạo được đối tượng mới | Chưa implement create endpoint | Thêm sau |
| Không xóa/di chuyển đối tượng | Chưa implement modify/delete endpoint | Thêm sau |
| Không xử lý được file CAD/Link | Cần truy cập cross-document | Thêm sau |
| Không xuất file (PDF, DWG...) | Chưa implement export endpoint | Thêm sau |

---

## Cách Sử dụng

### Cách 1: AI Chat DockablePane (Khuyến nghị)

1. Cài đặt `RevitBridge.bundle` vào `%APPDATA%\Autodesk\ApplicationPlugins\`
2. Mở Revit — plugin tự load
3. Nhập **Gemini API Key** lần đầu (lưu vào `config.json`)
4. Vào tab **AI** trên Ribbon → click **AI Chat** để mở panel
5. Gõ câu hỏi bằng tiếng Việt hoặc tiếng Anh

### Cách 2: Python CLI (Dev/Test)

1. Mở Revit với mô hình cần truy vấn (RevitBridge HTTP server tự khởi động tại `localhost:8080`)
2. Cấu hình `AIGateway/.env` (copy từ `.env.example`)
3. Cài dependencies: `pip install -r AIGateway/requirements.txt`
4. Chạy: `py AIGateway/chat.py`
5. Gõ câu hỏi bằng tiếng Việt hoặc tiếng Anh

---

## Đóng gói & Phân phối

```powershell
# Build + đóng gói ZIP
powershell -ExecutionPolicy Bypass -File package.ps1
```

Output: `dist/AI-for-Revit-v1.0.zip` chứa:

```
AI-for-Revit/
├── RevitBridge.bundle/        (Plugin Revit — copy vào ApplicationPlugins)
│   ├── PackageContents.xml
│   └── Contents/
│       ├── 2023/              (Revit 2023)
│       └── 2024/              (Revit 2024)
├── AIGateway/                 (Python chat — tùy chọn)
├── install.bat                (Cài đặt 1-click)
├── INSTALL.md                 (Hướng dẫn cài đặt)
└── README.md
```

---

## Cấu trúc Source Code

```
AI for Revit/
├── RevitBridge/                   # C# Plugin (chạy trong Revit)
│   ├── Application.cs                 # Entry point: HTTP Server + AI Chat DockablePane + Ribbon
│   ├── Core/
│   │   ├── HttpServer.cs              # HTTP server localhost:8080
│   │   ├── RequestRouter.cs           # Route → Handler
│   │   └── RevitApiHandler.cs         # Thread-safe Revit API access (Idling event)
│   ├── Chat/                          # ★ AI Chat tích hợp (không cần Python)
│   │   ├── AIChatPage.cs             # WPF DockablePane UI + streaming display
│   │   ├── ChatMessage.cs            # Chat message model
│   │   ├── GeminiService.cs          # Gemini REST API + streaming + history trim
│   │   ├── ToolExecutor.cs           # Map tool name → handler (gọi nội bộ)
│   │   └── FeedbackCollector.cs      # Thu thập feature requests → local + webhook
│   ├── Handlers/
│   │   ├── HealthHandler.cs           # GET /api/health
│   │   ├── ProjectInfoHandler.cs      # GET /api/project-info
│   │   ├── ElementsHandler.cs         # Elements + Categories + Summary + Conditions + Select + FindAndSelect
│   │   ├── ParametersHandler.cs       # Get/Set parameters
│   │   ├── ViewsHandler.cs            # Views listing
│   │   └── ModelInfoHandler.cs        # Warnings, Worksets, Links, Schedules
│   ├── Models/
│   │   ├── ApiRequest.cs              # Request models
│   │   └── ApiResponse.cs             # Response models (ProjectInfo, etc.)
│   ├── config.json                    # API key + webhook URL
│   ├── PackageContents.xml            # Bundle manifest (Revit 2023/2024)
│   └── RevitBridge.sln
│
├── AIGateway/                     # Python AI Layer (chế độ CLI)
│   ├── chat.py                    # Main chat loop (Gemini + Function Calling)
│   ├── tools.py                   # Tool definitions (Python gateway)
│   ├── revit_client.py            # HTTP client → RevitBridge
│   ├── requirements.txt           # google-genai, python-dotenv
│   └── .env.example               # Template API key
│
├── dist-template/                 # Template cho bản phân phối
│   ├── install.bat                # Script cài đặt 1-click
│   ├── INSTALL.md                 # Hướng dẫn cài đặt chi tiết
│   └── google_sheets_webhook.js   # Google Apps Script cho feedback webhook
│
├── package.ps1                    # Script đóng gói (Build + ZIP)
└── README.md                      # Tài liệu này
```
