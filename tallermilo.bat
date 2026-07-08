echo off
:Menu
color 05
cls

::Inicio del menu

echo ===============================================================================================================
echo *                                                                                                             *
echo *                                      M E N U     P R I N C I P A L                                          *
echo *                                                                                                             *
echo ===============================================================================================================
echo *                                                                                                             *
echo *                                                                                                             *
echo *                           1. Visualizar Fecha Y Hora                                                        *
echo *                                                                                                             *
echo *                           2. Crear Una Carpeta                                                              *
echo *                                                                                                             *
echo *                           3. Abrir App O Archivo                                                            *
echo *                                                                                                             *
echo *                           4. Forzar Cerrado De App O Archivo                                                *
echo *                                                                                                             *
echo *                           5. Limpiar Archivos Temporales                                                    *
echo *                                                                                                             *
echo *                           6. Salir                                                                          *
echo *                                                                                                             *
echo *                                                                                                             *
echo ===============================================================================================================
echo.

::Apartado de opciones

echo Selecciona Una Opcion Del Menu: 
echo. 
set /p opc=
if %opc%==1 goto :FechaHora
if %opc%==2 goto :CrearCarpeta
if %opc%==3 goto :Abrir
if %opc%==4 goto :Cerrar
if %opc%==5 goto :Limpiar
if %opc%==6 goto :exit

echo ERROR ESCOGE UNA OPCION VALIDA
pause
goto:Menu

::Opcion 1 fecha y hora (no es tan "wao" pero me gusto tenerlo en el menu)

 :FechaHora
cls
color F
color 
echo ===== FECHA Y HORA ACTUAL =====
echo Fecha: %date%
echo Hora: %time%
pause
goto Menu

::Opcion 2 crear carpeta

 :CrearCarpeta
cls
color F
echo =====Crear Una Carpeta=====
set /p nombre=Escribe El Nombre De La Carpeta A Crear:
mkdir %nombre%
echo Genial! :) Tu Carpeta %nombre% Ya Fue Creada 
pause 
goto Menu

::opcion 3 abrir aplicaciones o archivo por medio de ruta

 :Abrir
cls 
color F
echo =====Abrir Aplicacion O Archivo=====
set /p ruta=Escribe La Ruta Completa Del Archivo O Programa A Abrir: 
if exist "%ruta%" (
start "" "%ruta%"
echo Aplicacion O Archivo Abierto Correctamente.
) else (
echo Lo Lamento :( La Ruta No Existe. Verifique Que Sea Correcta.
)
pause
goto Menu

::Opcion 4 cerrar archivo o aplicaciones, este siento que fue el que mas contenido de clase tiene, me gusto mucho realizarlo :)

 :Cerrar
cls
color F
echo =====Procesos Activos=====
tasklist
echo ===========================================================================
echo.
echo Escribe El Nombre EXACTO Del Proceso A Cerrar (ejem: notepad.exe):  
set /p archivo=Nombre Del Proceso: 
taskkill /f /im %archivo%
echo Genial! :), Haz Cerrado Este Archivo : %archivo%
pause
goto Menu

::Opcion 5 limpiar archivo, un compañero me mostro esta opc con windows + r y busque la forma de que se limpiara 

 :Limpiar
cls
color F
echo LIMPIANDO ARCHIVOS TEMPORALES...
del /q %TEMP%\*.*
echo Genial! :) Se A Terminado Tu Limpieza
pause
goto Menu