@echo off
chcp 65001 >nul
title AI for Revit - Cài đặt

echo.
echo ============================================================
echo    AI for Revit - Cài đặt tự động
echo ============================================================
echo.

:: Kiểm tra thư mục RevitBridge.bundle
if not exist "%~dp0RevitBridge.bundle\" (
    echo [LỖI] Không tìm thấy thư mục RevitBridge.bundle!
    echo        Đảm bảo file install.bat nằm cùng thư mục với RevitBridge.bundle
    echo.
    pause
    exit /b 1
)

:: Đường dẫn đích
set "TARGET=%APPDATA%\Autodesk\ApplicationPlugins\RevitBridge.bundle"

echo [1/3] Đang copy RevitBridge.bundle...
echo       → %TARGET%

:: Xóa bundle cũ nếu có
if exist "%TARGET%" rmdir /s /q "%TARGET%"

:: Copy bundle mới
xcopy "%~dp0RevitBridge.bundle" "%TARGET%" /E /I /Q /Y >nul
if errorlevel 1 (
    echo [LỖI] Không thể copy files. Hãy thử chạy với quyền Administrator.
    pause
    exit /b 1
)

echo [2/3] Đang unblock DLL files...
powershell -Command "Get-ChildItem '%TARGET%' -Recurse -Filter *.dll | Unblock-File" 2>nul

echo [3/3] Hoàn tất!
echo.
echo ============================================================
echo    CÀI ĐẶT THÀNH CÔNG!
echo ============================================================
echo.
echo    Hướng dẫn sử dụng:
echo    1. Mở Revit (2023, 2024, hoặc 2025)
echo    2. Tab "AI for Revit" sẽ xuất hiện trên Ribbon
echo    3. Click "AI Chat" để mở cửa sổ chat
echo    4. Bắt đầu hỏi về mô hình Revit!
echo.
echo    API Key đã được cấu hình sẵn - không cần thao tác gì thêm.
echo.
pause
