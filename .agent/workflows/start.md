---
description: Khởi động AI - Đọc toàn bộ tri thức cần thiết trước khi làm việc. Chạy 1 lần khi mở cửa sổ mới.
---

# Khởi động AI for Revit

Workflow này giúp AI nạp lại toàn bộ tri thức cần thiết trong 1 bước.
User chạy `/start` khi mở cửa sổ chat mới, trước khi đặt yêu cầu.

## Bước 1: Đọc tri thức
// turbo-all
Đọc **đồng thời** tất cả các file sau bằng `view_file`:

1. `d:\AI for Revit\.agent\instructions.md` — Rules dự án
2. `d:\AI for Revit\.agent\lesson_learned.md` — Các lỗi đã gặp, tránh lặp lại
3. `d:\AI for Revit\.agent\workflows\revit-query.md` — Workflow mặc định + bảng endpoint

## Bước 2: Kiểm tra kết nối Revit
Gọi health check:
```
Invoke-RestMethod -Uri "http://localhost:8080/api/health" -TimeoutSec 5
```
- Nếu OK → thông báo: "✅ Đã sẵn sàng. Revit đang kết nối."
- Nếu lỗi → thông báo: "⚠️ Đã sẵn sàng. Revit chưa kết nối — hãy mở Revit và load plugin trước khi truy vấn model."

## Bước 3: Xác nhận
Trả lời user ngắn gọn:
```
✅ AI đã sẵn sàng!
- Rules: [số] rules đã nạp
- Endpoints: [số] endpoints có sẵn
- Revit: [trạng thái kết nối]

Bạn có thể đặt yêu cầu ngay bây giờ.
```

**KHÔNG cần scan project, KHÔNG cần list_dir, KHÔNG cần đọc source code C#/Python.**
