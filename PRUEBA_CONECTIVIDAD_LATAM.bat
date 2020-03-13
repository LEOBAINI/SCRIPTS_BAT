@echo off
TITLE TESTER DE CONECTIVIDAD MASTERMIND LATAM, INGRESE SU PAIS POR FAVOR.
set /p PAIS= ESCRIBA EL NOMBRE DE SU PAIS:

echo EJECUTANDO TEST DESDE  %PAIS% HACIA LATAM > PRUEBA_DESDE_%PAIS%.txt

setlocal

set "servers=IP:PORT:DESCR"
 ECHO ************************************ CHEQUEANDO COMUNICACION %PAIS% HACIA LATAM ************************************
:INICIO
for %%I in (%servers%) do (
    for /f "tokens=1,2,3 delims=:" %%a in ("%%I") do (
        set "port=%%~b"
	set "descr=%%~c"
        
        setlocal enabledelayedexpansion
        portqry -n "%%~a" -e "!port!" >NUL 2>NUL && (
            echo !descr! %%a port !port!: OK
	    echo !descr! %%a port !port!: OK >> PRUEBA_DESDE_%PAIS%.txt
	    
        ) || (
            echo !descr! %%a port !port!: Error 
	    echo !descr! %%a port !port!: Error >> PRUEBA_DESDE_%PAIS%.txt
	    
	
	
        )
	endlocal       
	
    )
) 
echo *************************************OBTENIENDO DATOS DE RED*************************************
hostname >> PRUEBA_DESDE_%PAIS%.txt
ipconfig >> PRUEBA_DESDE_%PAIS%.txt
route print >> PRUEBA_DESDE_%PAIS%.txt

ECHO POR FAVOR ENVIENOS EL ARCHIVO "PRUEBA_DESDE_%PAIS%.txt".
ECHO GRACIAS POR SU COLABORACION!!! .

PAUSE
