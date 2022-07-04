/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       REGEX_EXTRACT(birthday, '....-..-..', 2) 
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.csv' USING PigStorage(',') AS (
            id:int,
            name:CHARARRAY,
            mid_name:CHARARRAY,
            date:CHARARRAY,
            color:CHARARRAY,
            number:int
    );
data_month = FOREACH data GENERATE REGEX_EXTRACT(date,'(....-)([0-9][0-9)])-(..)',2);
STORE data_month INTO 'output' USING PigStorage(',');
DUMP data_month;

