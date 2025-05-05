@echo off
call setEnv.bat
"D:\Matlab\fulll\toolbox\shared\coder\ninja\win64\ninja.exe" -t compdb cc cxx cudac > compile_commands.json
"D:\Matlab\fulll\toolbox\shared\coder\ninja\win64\ninja.exe" -v %*
