@echo off
TITLE TESTER DE CONECTIVIDAD MASTERMIND EMEA, INGRESE SU PAIS POR FAVOR.
set /p PAIS= ESCRIBA EL NOMBRE DE SU PAIS:

echo EJECUTANDO TEST DESDE  %PAIS% HACIA LATAM > PRUEBA_DESDE_%PAIS%.txt

setlocal

set "servers=10.24.12.65:1433:MASTER_C_ESPAnA,10.24.12.66:1433:MASTER_D_ESPAnA,10.250.253.51:1433:MASTER_E_ESPAnA,10.250.253.52:1433:MASTER_F_ESPAnA,10.35.2.101:1433:MASTER_F_PORTUGAL,10.35.2.102:1433:MASTER_G_PORTUGAL"
 ECHO ************************************ CHEQUEANDO COMUNICACION %PAIS% HACIA EMEA ************************************
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
