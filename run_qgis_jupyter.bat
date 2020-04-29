:: Go to directory where the application's bat files are
pushd "C:\OSGeo4W64\bin"

:: Taken from C:\OSGeo4W64\bin\python-qgis.bat
call o4w_env.bat
call qt5_env.bat
call py3_env.bat
@echo off
path %OSGEO4W_ROOT%\apps\qgis\bin;%PATH%
set QGIS_PREFIX_PATH=%OSGEO4W_ROOT:\=/%/apps/qgis
set GDAL_FILENAME_IS_UTF8=YES
rem Set VSI cache to be used as buffer, see #6448
set VSI_CACHE=TRUE
set VSI_CACHE_SIZE=1000000
set QT_PLUGIN_PATH=%OSGEO4W_ROOT%\apps\qgis\qtplugins;%OSGEO4W_ROOT%\apps\qt5\plugins
set PYTHONPATH=%OSGEO4W_ROOT%\apps\qgis\python;%PYTHONPATH%
:: Comment this line since we don't want to run Python
::"%PYTHONHOME%\python" %* 

:: Have this for the first time to install Jupyter Notebook
::pip install notebook

:: Go back to original directory
pushd %~dp0
:: Open Jupyter Notebook on current directory
jupyter-notebook