/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

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

data1 = FOREACH data GENERATE ToString(f4, 'yyyy') AS anio;

grouped = GROUP data1 BY anio;

count_grouped =  FOREACH grouped GENERATE group, COUNT(data1);

STORE count_grouped INTO 'output' USING PigStorage(',');
