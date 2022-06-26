/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Obtenga los apellidos que empiecen por las letras entre la 'd' y la 'k'. La 
salida esperada es la siguiente:

  (Hamilton)
  (Holcomb)
  (Garrett)
  (Fry)
  (Kinney)
  (Klein)
  (Diaz)
  (Guy)
  (Estes)
  (Jarvis)
  (Knight)

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

data1 = FOREACH data GENERATE f3 as c1;

--data2 = FOREACH data1 GENERATE STARTSWITH(c1, (REGEX_SEARCH(c1, '(^[A-Z])')));

--filter_data1 = FILTER data1 BY STARTSWITH(c1, (REGEX_SEARCH(c1, '(^[A-Z])')));

filter_data1 = FILTER data1 BY (STARTSWITH(c1, 'D')) OR (STARTSWITH(c1, 'E')) OR (STARTSWITH(c1, 'F'))
                OR (STARTSWITH(c1, 'G')) OR (STARTSWITH(c1, 'H')) OR (STARTSWITH(c1, 'I'))
                OR (STARTSWITH(c1, 'J')) OR (STARTSWITH(c1, 'K'));

STORE filter_data1 INTO 'output' USING PigStorage(',');