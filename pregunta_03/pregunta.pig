/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' USING PigStorage('\t')
	AS (
		letra:chararray,
		fecha:chararray,
		valor:int
	);

data_subset = FOREACH data GENERATE valor;

ordered_data = ORDER data_subset BY valor asc;

limited_5 = LIMIT ordered_data 5;

STORE limited_5 INTO 'output' USING PigStorage(',');