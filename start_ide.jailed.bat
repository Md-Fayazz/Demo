@echo off

call .env/conan.jailed.env.bat

SET CONAN_USER_HOME=%cd%
SET CONAN_USE_ALWAYS_SHORT_PATHS=True
SET CONAN_USER_HOME_SHORT=%CONAN_USER_HOME%/.short
SET GTEST_OUTPUT=xml
SET VSEXT=Tools/vscode/extensions.py

if not exist ".build" (
	mkdir .build
)
cd .build
call ../remotes.bat
conan install --profile default ..
call activate.bat

python ../%VSEXT%
code .. | exit