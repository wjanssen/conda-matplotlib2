curl -L -O https://raw.githubusercontent.com/jbmohler/matplotlib-winbuild/master/deps_source/stdint.h

mkdir lib
copy %LIBRARY_LIB%\zlibstatic.lib lib\z.lib
if errorlevel 1 exit 1
copy %LIBRARY_LIB%\libpng_static.lib lib\png.lib
if errorlevel 1 exit 1

set LIB=%LIBRARY_LIB%;.\lib
set LIBPATH=%LIBRARY_LIB%;.\lib
set INCLUDE=%INCLUDE%;%LIBRARY_INC%;%LIBRARY_INC%\freetype2

copy setup.cfg.template setup.cfg
if errorlevel 1 exit 1

python setup.py install --old-and-unmanageable
if errorlevel 1 exit 1
