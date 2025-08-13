::直接拖入图片，自定义名称，就能拷贝到/assets目录，并把Markdown格式文本复制到剪贴板

@echo off
setlocal enabledelayedexpansion

:: 获取批处理文件所在目录
set "bat_dir=%~dp0"

:: 创建assets文件夹（如果不存在）
if not exist "%bat_dir%assets" mkdir "%bat_dir%assets"

:: 接收拖放到bat文件的图片
set "source_file=%~1"
if "!source_file!"=="" (
    echo 请将图片文件拖放到此批处理文件上
    timeout /t 3 >nul
    exit /b
)

:: 获取原文件扩展名
set "ext=%~x1"

:: 输入自定义文件名
set /p "new_name=请输入新文件名（不含扩展名）: "

:: 创建完整的文件名（带扩展名）
set "file_name=%new_name%%ext%"
set "new_file=%bat_dir%assets\!file_name!"

:: 复制图片到assets目录
copy "!source_file!" "!new_file!" >nul

:: Markdown格式文本
set "md_text=^![%file_name%!](/assets/%file_name%)"

:: 复制到剪贴板
echo !md_text!| clip

echo 已完成！
echo 图片已保存为: !new_file!
echo Markdown文本已复制到剪贴板: !md_text!
timeout /t 5 >nul
