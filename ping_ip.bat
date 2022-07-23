@echo off

@REM store passed file name in variable
set file=%1
if "%file%"=="" (
    echo input file not found!
    GOTO :eof
    )
    
@REM loop thro each line in a given file
for /f "delims=" %%i in (%file%) DO (
    
    @REM send icmp package and check the response
    ping -n 1 %%i | find "Reply" > NUL
    (
        IF ERRORLEVEL 1 (
            echo %%i is failed to respond
     ) ELSE (
        echo %%i is  live
        )
    )
)