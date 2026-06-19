@echo off
echo Starting portable WebDeck build...

python -m venv venv
call venv\Scripts\activate.bat

pip install -r requirements.txt
pip install pyinstaller

rmdir /s /q build 2>nul
rmdir /s /q dist 2>nul

pyinstaller --clean WebDeck.spec

echo Copying runtime folders beside WebDeck.exe...

xcopy webdeck dist\WebDeck\webdeck /E /I /Y
xcopy templates dist\WebDeck\templates /E /I /Y
xcopy static dist\WebDeck\static /E /I /Y
xcopy app dist\WebDeck\app /E /I /Y

echo Build done!
explorer dist\WebDeck
pause