@echo off
setlocal

set git_repo=https://github.com/renshichao2333/gamesavesync.git
set git_branch=master

echo Adding changes...
git add .

echo Committing changes...

for /f "tokens=1-4 delims=/ " %%a in ('date /t') do (
    set year=%%d
    set month=%%b
    set day=%%c
)

for /f "tokens=1-3 delims=:." %%a in ('time /t') do (
    set hour=%%a
    set minute=%%b
    set second=%%c
    set millisecond=%time:~9,2%
)

set datetime=%year%/%month%/%day%-%hour%:%minute%:%second%.%millisecond%

echo %datetime% > .git\COMMIT_EDITMSG
git commit -F .git\COMMIT_EDITMSG

echo Pushing changes to %git_branch% branch...
git push origin %git_branch%

echo Done.
pause