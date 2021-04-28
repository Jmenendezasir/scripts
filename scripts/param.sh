#!/bin/bash
clear
 echo -e "\n Número de parámetros: " $#
 echo -e "\n El último parámetro: " ${!#}
 echo -e "\n Todos los parámetros juntos: ( " $* " )"
 echo -e "\n Listado de parámetros"
for i in $@; do echo $i; done
