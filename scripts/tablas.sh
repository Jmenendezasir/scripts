clear
echo " "
echo "________________________________"
echo "    *TABLAS DE MULTIPLICAR*"
echo "--------------------------------"
echo " "
read -p "Dime un número: " NUM
echo " "
for (( n = 0; n<11; n++ ))
	do
	let res=$NUM*$n
	echo $NUM "x" $n "=" $res
done
