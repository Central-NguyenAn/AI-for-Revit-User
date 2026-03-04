# Lesson Learned Log

Cuốn sổ ghi chép các lỗi, khó khăn và bài học kinh nghiệm trong quá trình phát triển AI for Revit.

## Các lỗi thường gặp

| ID | Tool/Feature | Vấn đề | Giải pháp/Bài học |
|:---|:---|:---|:---|
| LL-001 | PackageContents.xml | `SeriesMin="2023"` không hoạt động — Revit không load plugin | `SeriesMin`/`SeriesMax` **PHẢI** có prefix `R`. Đúng: `R2023`, `R2024`. Sai: `2023`, `2024`. |
| LL-002 | PackageContents.xml | `ModuleName` trỏ thẳng tới `.dll` — Revit không nhận | `ModuleName` phải trỏ tới **file `.addin`**, không phải `.dll`. Chain: `PackageContents.xml` → `.addin` → `.dll`. |
| LL-003 | C# | `ProjectInfo` xung đột với `Autodesk.Revit.DB.ProjectInfo` | Dùng `Models.ProjectInfo` (fully qualified) hoặc đổi tên class. |
| LL-004 | C# | Variable shadowing — `result` dùng lại trong nested scope | Đặt tên khác cho biến bên trong lambda (VD: `elementInfos` thay vì `result`). |
| LL-005 | DevOps | File DLL bị lock khi Revit đang mở | Phải tắt Revit trước khi build lại. |
| LL-006 | Gemini API | Parameter type `array` thiếu trường `items` → HTTP 400 INVALID_ARGUMENT | Khi khai báo function parameter có `type: "array"`, **BẮT BUỘC** phải có `items: { type: "..." }` mô tả kiểu phần tử. VD: `{ type: "array", items: { type: "integer" } }`. |

## Kinh nghiệm kế thừa từ MyAddin
- Tham khảo đầy đủ tại: `D:\MyAddin\.agent\lesson_learned.md`
