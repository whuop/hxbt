@echo off
cls
haxe behaviour.hxml
if %errorlevel% neq 0 exit /b %errorlevel%
neko bin/behaviour.n