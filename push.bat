@echo off
pushd "C:\Users\7102581\OneDrive - アサヒグループ\デスクトップ\Python\code\github用"
git add .
set /p msg=Commit message: 
git commit -m "%msg%"
git push
popd
pause