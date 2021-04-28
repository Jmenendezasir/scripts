clear
read -p "Dame un número: " NUM
echo " "
let resto=$NUM%2
if [ $resto -eq 0 ];
	then
		echo "El número" $NUM "es par."
	else
		echo "El número" $NUM "no es par."
fi
