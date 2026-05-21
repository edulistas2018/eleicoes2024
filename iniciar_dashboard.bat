@echo off
title TSE Eleicoes 2024 - Servidor Local
mode con: cols=75 lines=20
color 0A

echo ===========================================================================
echo       JUSTICA ELEITORAL - PORTAL ANALITICO UNIFICADO ELEICOES 2024
echo ===========================================================================
echo.
echo  [*] Iniciando o Servidor Web Local seguro na porta 9000...
echo  [*] Usando a porta 9000 para evitar conflitos com outros servicos locais.
echo.
echo  [+] Abrindo o painel principal no seu navegador padrao...
echo      - URL: http://localhost:9000/dashboard_TSE.html
echo.
echo  [i] ATENCAO: Mantenha esta janela aberta enquanto estiver usando o painel.
echo      Para encerrar o servidor, basta fechar esta janela do terminal.
echo.
echo ===========================================================================
echo.

:: Abre o painel no navegador padrao
start http://localhost:9000/dashboard_TSE.html

:: Tenta rodar com o interpretador padrao do Python na porta 9000
python -m http.server 9000
if %ERRORLEVEL% neq 0 (
    :: Se falhar, tenta com o comando 'py' na porta 9000
    py -m http.server 9000
)
if %ERRORLEVEL% neq 0 (
    :: Se Python falhar, tenta com o Node.js/npx (http-server) na porta 9000
    echo  [!] Python nao detectado ou ocupado. Tentando via Node.js (npx)...
    npx http-server -p 9000
)

if %ERRORLEVEL% neq 0 (
    echo.
    echo  [ERRO] Nao foi possivel iniciar o servidor automaticamente.
    echo  Verifique se o Python ou Node.js estao instalados e no PATH.
    echo.
    pause
)
