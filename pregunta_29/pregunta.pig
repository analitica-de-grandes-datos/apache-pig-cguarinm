/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código en Pig para manipulación de fechas que genere la siguiente 
salida.

   1971-07-08,jul,07,7
   1974-05-23,may,05,5
   1973-04-22,abr,04,4
   1975-01-29,ene,01,1
   1974-07-03,jul,07,7
   1974-10-18,oct,10,10
   1970-10-05,oct,10,10
   1969-02-24,feb,02,2
   1974-10-17,oct,10,10
   1975-02-28,feb,02,2
   1969-12-07,dic,12,12
   1973-12-24,dic,12,12
   1970-08-27,ago,08,8
   1972-12-12,dic,12,12
   1970-07-01,jul,07,7
   1974-02-11,feb,02,2
   1973-04-01,abr,04,4
   1973-04-29,abr,04,4

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

data1 = FOREACH data GENERATE ToString(f4, 'yyyy-MM-dd') AS fecha, LOWER(ToString(f4, 'MMM')) AS nombre_corto_mes, 
                        ToString(f4, 'MM') AS mes, ToString(f4, 'M') AS mes2;

data2 = FOREACH data1 GENERATE fecha, (nombre_corto_mes == 'jan'? 'ene':(nombre_corto_mes == 'apr'? 'abr':(nombre_corto_mes == 'dec'? 'dic':(nombre_corto_mes == 'aug'? 'ago':nombre_corto_mes)))) as diaAbreviado,
mes, mes2; 

STORE data2 INTO 'output' USING PigStorage(',');
