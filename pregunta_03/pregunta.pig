/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lines = LOAD 'data.tsv' AS (key:CHARARRAY,date:CHARARRAY,val:int);
ordenar = ORDER lines BY val;
ordenar1 = FOREACH ordenar GENERATE val;
respuesta = LIMIT ordenar1 5;
STORE respuesta INTO 'output' USING PigStorage(',');
DUMP respuesta;
