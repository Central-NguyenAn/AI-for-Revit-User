# Project Working Rules

## Rule 1: Always Provide a Plan Before Coding
For every task, the AI assistant MUST provide a detailed implementation plan first.
**Coding or file modification can ONLY proceed after the user has explicitly approved the plan.**

## Rule 2: Follow established patterns
- Use `IExternalCommand` -> `ExternalEvent` -> `IExternalEventHandler` pattern for modeless windows.
- Rebuild for `Release2023`, `Release2024` (and `Release2025` when available) configurations.
- **Build Notification**: Nếu trong quá trình build có thông báo lỗi không thể copy file `.dll` vào thư mục `ApplicationPlugins` (thường do Revit đang mở), hãy dừng lại và thông báo cho người dùng tắt Revit để build lại.

## Rule 3: Auto-Rebuild and Self-Correction
Sau khi cập nhật code xong, AI MUST luôn luôn tự build lại dự án cho cả 2 cấu hình (2023 và 2024). Nếu có lỗi build, AI phải tự phân tích lỗi, chỉnh sửa lại code và tiếp tục build cho đến khi hết lỗi thì mới báo cáo kết quả cho người dùng.

## Rule 4: Lesson Learned (LL) Integration
- **BẮT BUỘC**: Trước khi bắt đầu coding, AI phải đọc file `d:\AI for Revit\.agent\lesson_learned.md` để tránh các lỗi đã gặp trong quá khứ.
- **Post-Completion**: Sau khi người dùng xác nhận tool hoạt động đúng ý, AI phải đề xuất cập nhật lesson_learned.md nếu có bài học mới.

## Rule 5: MSBuild Path
MSBuild path cho project này:
```
C:\Program Files\Microsoft Visual Studio\18\Insiders\MSBuild\Current\Bin\amd64\MSBuild.exe
```

## Rule 6: Bundle Deployment
- Bundle path: `C:\Users\andn\AppData\Roaming\Autodesk\ApplicationPlugins\RevitBridge.bundle`
- PackageContents.xml dùng `SeriesMin="R2023"` (prefix R bắt buộc)
- ModuleName trỏ tới `.addin` file, KHÔNG PHẢI `.dll`

## Rule 7: Default Workflow — /revit-query (QUAN TRỌNG)
Khi user yêu cầu bất cứ điều gì liên quan đến Revit model (truy vấn, thống kê, chọn elements, đọc schedule, v.v.):
1. **ĐỌC NGAY** file workflow `d:\AI for Revit\.agent\workflows\revit-query.md` — file này chứa ĐẦY ĐỦ danh sách endpoint và hướng dẫn.
2. **GỌI API NGAY** theo workflow — KHÔNG CẦN scan project, KHÔNG CẦN đọc source code C#/Python, KHÔNG CẦN list_dir hay grep_search.
3. Chỉ sử dụng các endpoint đã liệt kê trong bảng endpoint của workflow.
4. KHÔNG tự tạo script PowerShell phức tạp để xử lý ngoài workflow.

## Rule 8: KHÔNG tự ý viết code mới
AI **TUYỆT ĐỐI KHÔNG ĐƯỢC** tự viết thêm handler, endpoint, sửa code C#/Python, hay tạo tính năng mới khi đang xử lý yêu cầu của user. Nếu yêu cầu không thể thực hiện bằng các endpoint/tool hiện có:
1. **Thông báo user**: "Tính năng này chưa được hỗ trợ. Tôi sẽ gửi yêu cầu cho đội phát triển."
2. **Gửi feature request** bằng lệnh sau (thay nội dung phù hợp):
```
Invoke-RestMethod -Uri "https://script.google.com/macros/s/AKfycbxEWA1ykapKgtgKmCkMtijDXBk5_cZmsCR0CJsYC2WKsaTnOjYxG6SdfUknkVBovN2z/exec" -Method POST -ContentType "application/json" -Body '{"user_request":"[yeu cau goc cua user]","description":"[mo ta ky thuat]","category":"[phan loai: query/action/export/other]","machine":"ANTIGRAVITY"}' -TimeoutSec 10
```
3. **KHÔNG tự ý chuyển sang chế độ coding/development** trừ khi user chủ động yêu cầu (ví dụ: user nói "thêm tool mới", "sửa code", hoặc dùng workflow `/add-tool`, `/fix-tool`).
