@echo off

setlocal

set "servers=172.31.54.102:1433:SGT-BBDD,172.31.54.67:7548:SGT1_WFC,172.31.54.67:8733:SGT1_API,172.31.54.67:80:SGT1_WEB_PORT,172.31.54.68:7548:SGT2_WCF,172.31.54.68:8733:SGT2_API,172.31.54.68:80:SGT2_WEB_PORT,172.31.54.96:7563:RECORDING_14_STREAMING_PORT,172.31.54.90:80:MANAGEMENT_SERVER_2"
 ECHO ************************************ CHEQUEANDO COMUNICACION ************************************
:INICIO
for %%I in (%servers%) do (
    for /f "tokens=1,2,3 delims=:" %%a in ("%%I") do (
        set "port=%%~b"
	set "descr=%%~c"
        
        setlocal enabledelayedexpansion
        portqry -n "%%~a" -e "!port!" >NUL 2>NUL && (
            echo !descr! %%a port !port!: OK
	    
        ) || (
            echo !descr! %%a port !port!: Error 
	    
	
	
        )
	endlocal
	
       
	
    )
) 

echo ************************************ CHEQUEANDO ACCESO HTTP ************************************


curl.exe  -I  http://172.31.54.67/login.html
curl.exe  -I  http://172.31.54.68/login.html
echo ************************************ CHEQUEANDO DNS ************************************
NSLOOKUP SGT

PING SGT


REM /*BORRAR DESDE REM HASTA ACA PARA DEJAR CORRIENDO UN LOOP*/timeout /t 3
REM /*BORRAR DESDE REM HASTA ACA PARA DEJAR CORRIENDO UN LOOP*/GOTO :INICIO
PAUSE
