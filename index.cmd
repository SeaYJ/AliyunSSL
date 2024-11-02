@echo off
title SepSSL - Lego
color 0A

@REM REM 检查 ./ssl/ 目录是否存在，不存在则创建
echo [SepInfo] Check the environment.
IF NOT EXIST "./ssl" (
    mkdir ssl
    echo [SepInfo] The "./ssl" folder is created for you!
)

@REM REM 读取 config.ini 文件中的设置
echo [SepInfo] Reading configuration information from config.ini.
for /f "tokens=1,2 delims==" %%A in ('findstr /i "ALICLOUD_ACCESS_KEY ALICLOUD_SECRET_KEY EMAIL DOMAIN1 DOMAIN2 LEGO_DNS_RESOLVERS" config.ini') do (
    set %%A=%%B
)

@REM REM 输出读取的变量（可选，方便调试）
echo [SepInfo] Below is your Settings information, please check:
echo ----- 
echo ALICLOUD_ACCESS_KEY=%ALICLOUD_ACCESS_KEY%
echo ALICLOUD_SECRET_KEY=%ALICLOUD_SECRET_KEY%
echo EMAIL=%EMAIL%
@REM 注意这里你需要几个域名就写几个，但是一定要和 config.ini 里的设置对应上
echo DOMAIN1=%DOMAIN1%
echo DOMAIN2=%DOMAIN2%
echo LEGO_DNS_RESOLVERS=%LEGO_DNS_RESOLVERS%
echo -----

@REM REM 使用 lego 申请证书并保存到 ./ssl/ 文件夹中
echo.
echo [SepInfo] Running Lego!
"./bin/lego.exe" --email %EMAIL% --dns alidns --domains %DOMAIN1% --domains %DOMAIN2% --accept-tos --path "./ssl" --dns.resolvers=%LEGO_DNS_RESOLVERS% run

@REM REM 准备退出脚本
echo.
echo [SepInfo] It is completed!
echo [SepInfo] Press any key to exit.
pause 1>nul 2>nul
@echo on