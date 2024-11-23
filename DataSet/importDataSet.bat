@echo off

REM Obtém o diretorio onde o script esta localizado
set "SCRIPT_DIR=%~dp0"

REM Define o caminho para o diretório que contem os arquivos JSON
set "DATA_DIR=%SCRIPT_DIR%"

echo Iniciando a importacao para o banco de dados "AMPZ"...

REM Importar os arquivos JSON
for %%f in ("%DATA_DIR%\*.json") do (
    echo Importando %%~nxf...
    mongoimport --db AMPZ --collection %%~nf --file "%%f" --jsonArray
)

echo Importacao concluida com sucesso!
echo Verifique o banco de dados e as colecoes criadras no mongoDB

pause