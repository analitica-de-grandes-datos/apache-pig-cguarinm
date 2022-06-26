/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

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

data1 = FOREACH data GENERATE FLATTEN(f2);

grouped = GROUP data1 BY p;

contar_minusculas = FOREACH grouped GENERATE group, COUNT(data1);

STORE contar_minusculas INTO 'output' USING PigStorage(',');