# AI for Revit — Hướng dẫn Cài đặt

## Yêu cầu
- **Autodesk Revit** 2023, 2024, hoặc 2025
- **Windows** 10/11 (64-bit)
- **Kết nối internet** (để gọi Gemini AI)

---

## Cách 1: Cài đặt tự động (khuyến nghị)

1. Giải nén file `AI-for-Revit-v2.2.zip`
2. **Tắt Revit** nếu đang mở
3. Double-click **`install.bat`**
4. Mở lại Revit → Tab **"AI for Revit"** xuất hiện trên Ribbon

---

## Cách 2: Cài đặt thủ công

1. Copy toàn bộ thư mục `RevitBridge.bundle` vào:
   ```
   %APPDATA%\Autodesk\ApplicationPlugins\
   ```
   (Paste đường dẫn trên vào thanh địa chỉ của File Explorer)

2. Click phải vào các file `.dll` → Properties → tick **Unblock** → OK

3. Mở Revit

---

## Sử dụng

1. Mở Revit với mô hình cần truy vấn
2. Trên Ribbon, click tab **"AI for Revit"** → **"AI Chat"**
3. Cửa sổ chat mở bên phải, gõ câu hỏi bằng tiếng Việt hoặc tiếng Anh

### Ví dụ câu hỏi:
- "Mô hình có bao nhiêu ống?"
- "Tổng chiều dài ống CDD?"
- "Liệt kê warnings trong mô hình"
- "Đổi Mark của ống 7391236 thành ABC-001"

---

## Gỡ cài đặt

Xóa thư mục:
```
%APPDATA%\Autodesk\ApplicationPlugins\RevitBridge.bundle
```

---

## Xử lý sự cố

| Vấn đề | Cách xử lý |
|---|---|
| Không thấy tab AI for Revit | Kiểm tra bundle đã nằm đúng thư mục ApplicationPlugins |
| Lỗi "Could not load file" | Click phải DLL → Properties → Unblock |
| Chat không phản hồi | Kiểm tra kết nối internet |
| Lỗi 429 (rate limit) | Chờ 1 phút rồi thử lại |


