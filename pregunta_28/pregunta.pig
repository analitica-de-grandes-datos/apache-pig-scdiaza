/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       birthday, 
       DATE_FORMAT(birthday, "yyyy"),
       DATE_FORMAT(birthday, "yy"),
   FROM 
       persons
   LIMIT
       5;

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
            number:int);
            
data_date = FOREACH data GENERATE GetYear(ToDate(date,'YYYY-MM-DD')),SUBSTRING(date,2,4);
STORE data_date INTO 'output' USING PigStorage(',');
DUMP data_date;
