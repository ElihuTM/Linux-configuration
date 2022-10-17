#!/bin/bash

echo "preparando configuracion de git"
for i in `seq 1 30`; do
	echo -n '.'
	sleep 0.01
done
echo '.'
	

echo -n "¿Desea registar nombre de usuario[y\\n]? "
read opc

if [ "$opc" = "y" ]; then
	while [[ true ]]; do
		echo -n "nombre de usuario: "
		read username
		echo -n "username:$username ¿Es correcto [y\\n]? "
		read opc

		if [ "$opc" = "y" ]; then
			break;
		fi

	done

	git config --global user.name "$username" && echo "username registrado exitosamente" && echo ".............................."
fi

echo -n "¿Desea registar correo electronico[y\\n]? "
read opc

if [ "$opc" = "y" ]; then
	while [[ true ]]; do
		echo -n "email: "
		read email
		echo -n "email:$email ¿Es correcto [y\\n]? "
		read opc

		if [ "$opc" = "y" ]; then
			break;
		fi

	done

	git config --global user.email "$email" && echo "email registrado exitosamente"
fi

echo "creando alias..."
git config --global alias.lg "log --oneline --decorate --all --graph"
git config --global alias.s "status -sb"

