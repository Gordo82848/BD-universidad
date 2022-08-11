echo Instalador de la base de datos Universidad
echo Autor: Samanez Ccoscco Deyvis Jhoswa
echo 10 de agosto de 2022
sqlcmd -SDESKTOP-EV8UTDS\SQLEXPRESS -E -i universidadBD.sql
sqlcmd -SDESKTOP-EV8UTDS\SQLEXPRESS -E -i universidadBDPA.sql
sqlcmd -SDESKTOP-EV8UTDS\SQLEXPRESS -E -i TEscuelaPA.sql
sqlcmd -SDESKTOP-EV8UTDS\SQLEXPRESS -E -i TAlumnoPA.sql
echo Se ejecutó correctamente la base de datos
pause