/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' USING PigStorage('\t') AS (
        f1:CHARARRAY,
        f2:BAG{t: TUPLE(p:CHARARRAY)},
        f3:MAP[]
    );

data1 = FOREACH data GENERATE f1, SIZE(f2) AS f2, SIZE(f3) AS f3;

ordered_data1 = ORDER data1 BY f1, f2, f3 asc;

STORE ordered_data1 INTO 'output' USING PigStorage(',');