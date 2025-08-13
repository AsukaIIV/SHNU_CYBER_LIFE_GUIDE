::ֱ������ͼƬ���Զ������ƣ����ܿ�����/assetsĿ¼������Markdown��ʽ�ı����Ƶ�������

@echo off
setlocal enabledelayedexpansion

:: ��ȡ�������ļ�����Ŀ¼
set "bat_dir=%~dp0"

:: ����assets�ļ��У���������ڣ�
if not exist "%bat_dir%assets" mkdir "%bat_dir%assets"

:: �����Ϸŵ�bat�ļ���ͼƬ
set "source_file=%~1"
if "!source_file!"=="" (
    echo �뽫ͼƬ�ļ��Ϸŵ����������ļ���
    timeout /t 3 >nul
    exit /b
)

:: ��ȡԭ�ļ���չ��
set "ext=%~x1"

:: �����Զ����ļ���
set /p "new_name=���������ļ�����������չ����: "

:: �����������ļ���������չ����
set "file_name=%new_name%%ext%"
set "new_file=%bat_dir%assets\!file_name!"

:: ����ͼƬ��assetsĿ¼
copy "!source_file!" "!new_file!" >nul

:: Markdown��ʽ�ı�
set "md_text=^![%file_name%!](/assets/%file_name%)"

:: ���Ƶ�������
echo !md_text!| clip

echo ����ɣ�
echo ͼƬ�ѱ���Ϊ: !new_file!
echo Markdown�ı��Ѹ��Ƶ�������: !md_text!
timeout /t 5 >nul
