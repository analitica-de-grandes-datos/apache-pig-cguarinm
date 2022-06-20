/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

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

data1 = FOREACH data GENERATE FLATTEN(f3);

data2 = FOREACH data1 GENERATE $0 AS key;

grouped = GROUP data2 BY key;

contar_key = FOREACH grouped GENERATE group, COUNT(data2);

STORE contar_key INTO 'output' USING PigStorage(',');
