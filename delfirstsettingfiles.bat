rd /S /Q %temp%\.RJC\
del /Q %temp%\.Rtm_Json_Creator.tscf
del /Q %temp%\.ams1.tscf
del /Q %temp%\.ams2.tscf
del /Q %temp%\rjcupdate.tscf
del /Q %temp%\rjcversion.tscf
pushd %temp%
del /q %temp%\delete.bat
for /f %%a in ('dir /s /b *_delete.bat') do (del /q %%a)
popd