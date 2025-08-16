@echo off
setlocal
set SCRIPT_DIR=%~dp0
set EXE=%SCRIPT_DIR%por-do-sol\lib\pordosol.exe
if not exist "%EXE%" (
  echo pordosol.exe nao encontrado em %EXE%. Rode configurar-ambiente.ps1 e compile ferramentas-cli.
  exit /b 1
)
"%EXE%" %*
