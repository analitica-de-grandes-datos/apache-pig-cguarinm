/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta en SQL.

   SELECT
       color
   FROM 
       u 
   WHERE 
       color 
   LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

         >>> Escriba su respuesta a partir de este punto <<< 
*/
data = LOAD 'data.csv' USING PigStorage(',') AS (
        f1:INT,
        f2:CHARARRAY,
        f3:CHARARRAY,
        f4:CHARARRAY,
        f5:CHARARRAY,
        F6:INT
);

data1 = FOREACH data GENERATE f5 as c1;

filter_data1 = FILTER data1 BY STARTSWITH(c1, 'b');

STORE filter_data1 INTO 'output' USING PigStorage(',');
