@echo off
setlocal

set "servers=172.31.54.96:7563"
:inicio
for %%I in (%servers%) do (
    for /f "tokens=1,2 delims=:" %%a in ("%%I") do (
        set "port=%%~b"       
	SET "FECHA=%date% %time% %1"
	setlocal enabledelayedexpansion
	
        portqry -n "%%~a" -e "!port!" >NUL 2>NUL && (
            echo %FECHA% %%a port !port!: OK 
        ) || (
            echo %FECHA% %%a port !port!: Error  
	    echo %FECHA% %%a port !port!: Error >> ERROR.LOG
	  	
	    
        )
        endlocal
    )
)

	REM timeout /t 1
        goto :inicio
