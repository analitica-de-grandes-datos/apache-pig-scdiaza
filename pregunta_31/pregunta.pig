/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

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
data_date = FOREACH data GENERATE GetYear(ToDate(date,'YYYY-MM-DD')) AS dates;
grouped = GROUP data_date BY dates;
wordcount = FOREACH grouped GENERATE group, COUNT($1);
STORE wordcount INTO 'output' USING PigStorage(',');
DUMP wordcount;
