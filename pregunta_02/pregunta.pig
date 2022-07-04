/*
Pregunta
===========================================================================

Ordene el archivo `data.tsv`  por letra y valor (3ra columna). Escriba el
resultado separado por comas.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

     >>> Escriba el codigo del mapper a partir de este punto <<<
*/

lines = LOAD 'data.tsv' AS (key:CHARARRAY,date:CHARARRAY,val:int);
ordenar = ORDER lines BY key,val;
STORE ordenar INTO 'output' USING PigStorage(',');
DUMP ordenar;
