@echo off

call .env/conan.environment.bat
SET vsextention=Tools/vscode/extensions.py
SET GTEST_OUTPUT=xml

if not exist ".build" (
	mkdir .build
)
cd .build
call ../remotes.bat
conan install --profile default ..
call activate.bat
python ../%vsextention%


code .. | exit
