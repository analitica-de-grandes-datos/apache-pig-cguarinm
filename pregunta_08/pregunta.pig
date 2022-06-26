/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

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

data1 = FOREACH data GENERATE FLATTEN(f2) AS c2, KEYSET($2) AS c3;

ordered_data1 = ORDER data1 BY c2, c3 asc;

data2 = FOREACH ordered_data1 GENERATE c2, FLATTEN(c3) as c4;

data3 = FOREACH data2 GENERATE TOTUPLE(c2,c4) as c5;

grouped = GROUP data3 BY c5;

count_grouped =  FOREACH grouped GENERATE group, COUNT(data3);

STORE count_grouped INTO 'output' USING PigStorage(',');