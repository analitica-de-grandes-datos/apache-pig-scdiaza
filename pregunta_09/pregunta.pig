/*
Pregunta
===========================================================================

Para el archivo `data.csv` escriba una consulta en Pig que genere la 
siguiente salida:

  Vivian@Hamilton
  Karen@Holcomb
  Cody@Garrett
  Roth@Fry
  Zoe@Conway
  Gretchen@Kinney
  Driscoll@Klein
  Karyn@Diaz
  Merritt@Guy
  Kylan@Sexton
  Jordan@Estes
  Hope@Coffey
  Vivian@Crane
  Clio@Noel
  Hope@Silva
  Ayanna@Jarvis
  Chanda@Boyer
  Chadwick@Knight

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.csv' USING PigStorage(',') AS (
            id:int,
            name:CHARARRAY,
            mid_name:CHARARRAY,
            date:datetime,
            color:CHARARRAY,
            number:int);
            
data_concat = FOREACH data GENERATE CONCAT(name,'@',mid_name);
STORE data_concat INTO 'output'; 
DUMP data_concat;
