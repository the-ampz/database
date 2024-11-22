@echo off
REM Definir variáveis
set "SCRIPT_DIR=%~dp0"
set "DATA_FILE=%SCRIPT_DIR%DataSet\export_data.json"
set "DB_NAME=AMPZ"
set "COLLECTION_NAME=DataSetAMPZ"
set "MONGO_URI=mongodb://127.0.0.1:27017"

REM Mensagem inicial
echo Iniciando a importação para o banco de dados "%DB_NAME%" na coleção "%COLLECTION_NAME%"...

REM Verificar se o arquivo existe
if not exist "%DATA_FILE%" (
    echo ERRO: O arquivo "%DATA_FILE%" não foi encontrado.
    pause
    exit /b 1
)

REM Comando de importação
echo Importando "%DATA_FILE%" para a coleção "%COLLECTION_NAME%" no banco "%DB_NAME%"...
mongoimport --uri %MONGO_URI% --db %DB_NAME% --collection %COLLECTION_NAME% --file "%DATA_FILE%" --jsonArray

REM Verificar o resultado da operação
if %errorlevel% neq 0 (
    echo ERRO: Falha ao importar o arquivo "%DATA_FILE%".
    pause
    exit /b 1
)

REM Mensagem de conclusão
echo Importação concluída com sucesso!
echo Verifique o banco de dados "%DB_NAME%" e a coleção "%COLLECTION_NAME%" criada no MongoDB.
pause
