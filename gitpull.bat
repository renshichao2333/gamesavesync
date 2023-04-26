@echo off
setlocal

set git_repo=https://github.com/renshichao2333/gamesavesync.git
set git_branch=master
set git_folder=%cd%
echo Cloning %git_repo%...
git clone -b %git_branch% %git_repo% %git_folder%

echo Updating %git_branch% branch...
cd %git_folder%
git pull origin %git_branch%

echo Done.
pause