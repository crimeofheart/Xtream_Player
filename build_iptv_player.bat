@echo off
REM Change to the directory where this batch file is located
pushd "%~dp0"

cls
echo ===============================
echo Xtream Player Build Script
echo ===============================
echo Batch file location: %~dp0
echo Current working directory: %CD%
echo ===============================

REM Verify we're in the right directory by checking for main file
IF NOT EXIST "IPTV M3U_Plus PLAYER by MY-1.py" (
    echo ERROR: Main script not found in current directory!
    echo This batch file must be in the same folder as the Python files.
    echo.
    echo Please copy this batch file to the folder containing:
    echo - IPTV M3U_Plus PLAYER by MY-1.py
    echo - Images folder
    echo - Other Python files
    echo.
    pause
    exit /b 1
)

echo ✓ Found main Python script

REM Check Images folder
IF NOT EXIST "Images" (
    echo ERROR: Images folder not found!
    echo Please make sure the Images folder is in this directory.
    pause
    exit /b 1
)

echo ✓ Found Images folder
echo ✓ Running from correct directory

REM Simple PyInstaller test - we know it works from your test
echo.
echo Testing PyInstaller...
pyinstaller --version >nul 2>&1
IF ERRORLEVEL 1 (
    echo ERROR: PyInstaller not found! Please install it:
    echo python -m pip install pyinstaller
    pause
    exit /b 1
)

echo ✓ PyInstaller is available

REM Set variables
SET MAIN_SCRIPT="IPTV M3U_Plus PLAYER by MY-1.py"
SET BUILD_PATH=build
SET DIST_PATH=dist

REM Clean previous builds
IF EXIST %BUILD_PATH% (
    echo Cleaning previous build...
    rmdir /s /q %BUILD_PATH%
)

IF EXIST %DIST_PATH% (
    echo Cleaning previous dist...
    rmdir /s /q %DIST_PATH%
)

echo.
echo Starting build...
echo.

REM Run PyInstaller
pyinstaller ^
  --onefile ^
  --noconsole ^
  --noconfirm ^
  --icon "Images/TV_icon.ico" ^
  --name "IPTV_Player" ^
  --workpath %BUILD_PATH% ^
  --distpath %DIST_PATH% ^
  --add-data "Images/TV_icon.ico;Images" ^
  --add-data "Images/404_not_found.png;Images" ^
  --add-data "Images/no_image.jpg;Images" ^
  --add-data "Images/loading-icon.png;Images" ^
  --add-data "Images/home_tab_icon.ico;Images" ^
  --add-data "Images/tv_tab_icon.ico;Images" ^
  --add-data "Images/movies_tab_icon.ico;Images" ^
  --add-data "Images/series_tab_icon.ico;Images" ^
  --add-data "Images/favorite_tab_icon.ico;Images" ^
  --add-data "Images/favorite_tab_icon_colour.ico;Images" ^
  --add-data "Images/info_tab_icon.ico;Images" ^
  --add-data "Images/settings_tab_icon.ico;Images" ^
  --add-data "Images/search_bar_icon.ico;Images" ^
  --add-data "Images/sorting_icon.ico;Images" ^
  --add-data "Images/clear_button_icon.ico;Images" ^
  --add-data "Images/go_back_icon.ico;Images" ^
  --add-data "Images/account_manager_icon.ico;Images" ^
  --add-data "Images/film_camera_icon.ico;Images" ^
  --add-data "Images/primary_full-TMDB.svg;Images" ^
  --add-data "Images/yt_icon_rgb.png;Images" ^
  --add-data "Images/unknown_status.png;Images" ^
  --add-data "Images/online_status.png;Images" ^
  --add-data "Images/maybe_status.png;Images" ^
  --add-data "Images/offline_status.png;Images" ^
  --add-data "Threadpools.py;." ^
  --add-data "CustomPyQtWidgets.py;." ^
  --add-data "AccountManager.py;." ^
  %MAIN_SCRIPT%

IF ERRORLEVEL 1 (
    echo.
    echo ERROR: Build failed!
    pause
    exit /b 1
)

echo.
echo ✓ Build completed successfully!
echo.
echo Your executable is in: %CD%\%DIST_PATH%\IPTV_Player.exe
echo.

REM Offer to open the dist folder
set /p open_folder="Open dist folder? (y/n): "
if /i "%open_folder%"=="y" (
    explorer.exe %DIST_PATH%
)

pause
