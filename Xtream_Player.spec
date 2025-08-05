# -*- mode: python ; coding: utf-8 -*-


a = Analysis(
    ['Xtream_Player.py'],
    pathex=[],
    binaries=[],
    datas=[('Images/TV_icon.ico', 'Images'), ('Images/404_not_found.png', 'Images'), ('Images/no_image.jpg', 'Images'), ('Images/loading-icon.png', 'Images'), ('Images/home_tab_icon.ico', 'Images'), ('Images/tv_tab_icon.ico', 'Images'), ('Images/movies_tab_icon.ico', 'Images'), ('Images/series_tab_icon.ico', 'Images'), ('Images/favorite_tab_icon.ico', 'Images'), ('Images/favorite_tab_icon_colour.ico', 'Images'), ('Images/info_tab_icon.ico', 'Images'), ('Images/settings_tab_icon.ico', 'Images'), ('Images/search_bar_icon.ico', 'Images'), ('Images/sorting_icon.ico', 'Images'), ('Images/clear_button_icon.ico', 'Images'), ('Images/go_back_icon.ico', 'Images'), ('Images/account_manager_icon.ico', 'Images'), ('Images/film_camera_icon.ico', 'Images'), ('Images/primary_full-TMDB.svg', 'Images'), ('Images/yt_icon_rgb.png', 'Images'), ('Images/unknown_status.png', 'Images'), ('Images/online_status.png', 'Images'), ('Images/maybe_status.png', 'Images'), ('Images/offline_status.png', 'Images'), ('Threadpools.py', '.'), ('CustomPyQtWidgets.py', '.'), ('AccountManager.py', '.')],
    hiddenimports=[],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
    optimize=0,
)
pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.datas,
    [],
    name='Xtream_Player',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon=['Images\\TV_icon.ico'],
)
