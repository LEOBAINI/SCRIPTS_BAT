@echo off
TITLE TESTER DE CONECTIVIDAD MASTERMIND LATAM, INGRESE SU PAIS POR FAVOR.
set /p PAIS= ESCRIBA EL NOMBRE DE SU PAIS:

echo EJECUTANDO TEST DESDE  %PAIS% HACIA LATAM > PRUEBA_DESDE_%PAIS%.txt

setlocal

set "servers=10.54.118.60:1433:ARGENTINA_SVR_A,10.54.248.240:1433:ARGENTINA_SVR_B,10.54.248.82:1433:ARGENTINA_SVR_C,10.56.144.43:1433:CHILE_SVR_A,10.56.130.91:1433:CHILE_SVR_B,10.57.0.18:1433:COLOMBIA_SVR_B,10.57.0.20:1433:COLOMBIA_SVR_A,10.58.110.31:1433:PARAGUAY_B,10.58.110.30:1433:PARAGUAY_A,10.59.0.101:1433:URUGUAY_SVR_F,10.59.0.100:1433:URUGUAY:SVR_E,10.51.132.167:1433:PERU_SVR_B,10.51.132.132:1433:PERU_SVR_C,10.51.0.142:1433:PERU_SVR_A"
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
