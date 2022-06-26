/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el codigo en Pig para manipulación de fechas que genere la siguiente
salida.

   1971-07-08,08,8,jue,jueves
   1974-05-23,23,23,jue,jueves
   1973-04-22,22,22,dom,domingo
   1975-01-29,29,29,mie,miercoles
   1974-07-03,03,3,mie,miercoles
   1974-10-18,18,18,vie,viernes
   1970-10-05,05,5,lun,lunes
   1969-02-24,24,24,lun,lunes
   1974-10-17,17,17,jue,jueves
   1975-02-28,28,28,vie,viernes
   1969-12-07,07,7,dom,domingo
   1973-12-24,24,24,lun,lunes
   1970-08-27,27,27,jue,jueves
   1972-12-12,12,12,mar,martes
   1970-07-01,01,1,mie,miercoles
   1974-02-11,11,11,lun,lunes
   1973-04-01,01,1,dom,domingo
   1973-04-29,29,29,dom,domingo

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' USING PigStorage(',') AS (
        f1:INT,
        f2:CHARARRAY,
        f3:CHARARRAY,
        f4:DATETIME,
        f5:CHARARRAY,
        F6:INT
);

data1 = FOREACH data GENERATE ToString(f4, 'yyyy-MM-dd') AS fecha, ToString(f4, 'dd') AS dia, ToString(f4, 'd') AS dia2, ToString(f4, 'EEE') AS nombre_corto_dia, ToString(f4, 'EEEE') AS nombre_dia;

data2 = FOREACH data1 GENERATE fecha, dia, dia2, (nombre_corto_dia == 'Mon'? 'lun':(nombre_corto_dia == 'Tue'? 'mar':(nombre_corto_dia == 'Wed'? 'mie': 
(nombre_corto_dia == 'Thu'? 'jue':(nombre_corto_dia == 'Fri'? 'vie':(nombre_corto_dia == 'Sat'? 'sab':(nombre_corto_dia == 'Sun'? 'dom':'falso'))))))) as diaAbreviado,  
(nombre_dia == 'Monday'? 'lunes':(nombre_dia == 'Tuesday'? 'martes':(nombre_dia == 'Wednesday'? 'miercoles': 
(nombre_dia == 'Thursday'? 'jueves':(nombre_dia == 'Friday'? 'viernes':(nombre_dia == 'Saturday'? 'sabado':(nombre_dia == 'Sunday'? 'domingo':'falso'))))))) as diaCompleto; 

STORE data2 INTO 'output' USING PigStorage(',');