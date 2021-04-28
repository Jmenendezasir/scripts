#!/bin/bash
clear
# let $enero = "31" let $febrero = "28" let $marzo = "31" let $abril = "30" let $mayo = "31" let $junio = "30" let $julio = "31" let $agosto = "31" let $septiembre = "30" let $octubre = "31" let $noviembre = "30" let $diciembre = "31"
let enero "1" 
let febrero "2" 
let marzo "3" 
let abril "4" 
let mayo "5" 
let junio "6" 
let julio "7" 
let agosto "8" 
let septiembre "9" 
let octubre "10" 
let noviembre "11" 
let diciembre "12"
let mes " "

if [ "$1" -eq "1" ]; then
 mes="Enero"
fi
if [ "$1" -eq "2" ]; then
 mes="Febrero"
fi
if [ "$1" -eq "3" ]; then
 mes="Marzo"
fi
if [ "$1" -eq "4" ]; then
 mes="Abril"
fi
if [ "$1" -eq "5" ]; then
 mes="Mayo"
fi
if [ "$1" -eq "6" ]; then
 mes="Junio"
fi
if [ "$1" -eq "7" ]; then
 mes="Julio"
fi
if [ "$1" -eq "8" ]; then
 mes="Agosto"
fi
if [ "$1" -eq "9" ]; then
 mes="Septiembre"
fi
if [ "$1" -eq "10" ]; then
 mes="Octubre"
fi
if [ "$1" -eq "11" ]; then
 mes="Noviembre"
fi
if [ "$1" -eq "12" ]; then
 mes="Diciembre"
fi

if [ $mes = "Enero" ] && [ $2 -le "31" ]; then
  echo "Es el día" $2 "de" $mes
 elif [ $mes = "Febrero" ] && [ $2 -le "28" ]; then
  echo "Es el día" $2 "de" $mes
   elif [ $mes = "Marzo" ] && [ $2 -le "31" ]; then
  echo "Es el día" $2 "de" $mes
    elif [ $mes = "Abril" ] && [ $2 -le "30" ]; then
  echo "Es el día" $2 "de" $mes
     elif [ $mes = "Mayo" ] && [ $2 -le "31" ]; then
  echo "Es el día" $2 "de" $mes
      elif [ $mes = "Junio" ] && [ $2 -le "30" ]; then
  echo "Es el día" $2 "de" $mes
       elif [ $mes = "Julio" ] && [ $2 -le "30" ]; then
  echo "Es el día" $2 "de" $mes
        elif [ $mes = "Agosto" ] && [ $2 -le "31" ]; then
  echo "Es el día" $2 "de" $mes
         elif [ $mes = "Septiembre" ] && [ $2 -le "30" ]; then
  echo "Es el día" $2 "de" $mes
          elif [ $mes = "Octubre" ] && [ $2 -le "31" ]; then
  echo "Es el día" $2 "de" $mes
           elif [ $mes = "Noviembre" ] && [ $2 -le "30" ]; then
  echo "Es el día" $2 "de" $mes
            elif [ $mes = "Diciembre" ] && [ $2 -le "31" ]; then
  echo "Es el día" $2 "de" $mes
 else
  echo "No es un día correcto de" $mes
fi
