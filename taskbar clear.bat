@ECHO OFF
 
::本脚本为靳薪手打，为方便快速配置美化任务栏，更多功能设置请参照注册表信息详表。本文件仅供学习交流，不可作为商业用途。
 
CHOICE /C YN /M "是否确认配置注册表，是请按 Y，否请按 N"
 
if %errorlevel% ==Y goto begin
 
if %errorlevel% ==N goto end
 
:begin
 
echo 开始配置美化……
 
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d 1 /f
 
::合并任务栏按钮（配置为始终合并）
 
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f
 
::搜索框样式（配置为隐藏）
 
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d 0 /f
 
::小娜Cortana按钮（配置为禁用小娜）
 
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f
 
::任务视图按钮（配置为隐藏）
 
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d 0 /f
 
::人脉按钮（配置为隐藏）
 
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d 1 /f
 
::操作中心按钮（配置为隐藏）
 
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PenWorkspace" /v "PenWorkspaceButtonDesiredVisibility" /t REG_DWORD /d 0 /f
 
::Windows lnk按钮（配置为禁用）
 
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t REG_DWORD /d 1 /f
 
::小任务栏按钮（配置为小任务按钮）
 
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoCloseDragDropBands" /t REG_DWORD /d 1 /f
 
::移除工具栏（配置为禁止添加、拖放和关闭）

reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "TaskbarNoPinnedList" /t REG_DWORD /d 1 /f
 
 ::禁止固定到任务栏（配置为禁止固定到任务栏，已固定的会被隐藏，重新启用会再次出现，文件右键菜单“固定到任务栏”会同时消失，无法拖动文件固定）
 
 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD  /d 2 /f
 
 ::移除资讯和兴趣（配置为隐藏所有内容）
 
taskkill /f /im explorer.exe & start explorer.exe
::重启资源管理器
 
echo 完成任务栏美化，感谢使用~~（靳薪教学）
 
pause>nul
