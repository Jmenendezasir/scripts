#!\bin\bash
clear
contador=0
while [ $contador -le 10 ]
 do
  echo "El número es" $contador"."
  let contador++
done
