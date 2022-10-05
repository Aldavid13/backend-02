#!/bin/sh


set -e
nombrePesona=${nombre}
sed -i "s|NOMBRE|$nombrePesona|g" /app/prac_variables_entorno
export texto=$(cat /app/prac_variables_entorno)
java -jar /app/demo-Variable.jar

exec "$@"



#set -e
#source /usr/src/myapp/docbash.sh
#sed -i 's/NOMBRE/'$nombre'/g' prac_variables_entorno
#export texto=$(cat prac_variables_entorno)

#exec "$@"

