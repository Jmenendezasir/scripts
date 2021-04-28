#!/bin/bash
clear
PS3="Selecciona un valor de la lista   "
select CARACTER in Pepe Luis Antonio Sergio Salir
 do
  if [ $REPLY == "5" ]
   then
    echo "Has salido correctamente."
    break
  fi
  echo -e "Te mola $CARACTER"
  echo -e "Pulsaste la opción $REPLY"
 done
