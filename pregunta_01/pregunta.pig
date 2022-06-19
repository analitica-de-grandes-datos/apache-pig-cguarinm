/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' USING PigStorage('\t')
	AS (
		letra:chararray,
		fecha:chararray,
		numero:int
	);

data_subset = FOREACH data GENERATE letra;

letras_subset = GROUP data_subset BY letra;

contar_letras = FOREACH letras_subset GENERATE group, COUNT(data_subset);

STORE contar_letras INTO 'output' USING PigStorage(',');
