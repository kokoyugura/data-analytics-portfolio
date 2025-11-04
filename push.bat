@echo off
pushd "%~dp0"
git add .
set /p msg=Commit message: 
git commit -m "%msg%"
git push
popd
pause