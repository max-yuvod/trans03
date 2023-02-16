#!/bin/bash
  
##########################
# Llama al primer script #
##########################
# Este realiza el backup del config file y lo deja en la ruta /etc/flussonic/flussonicdailybkp con su fecha correspondiente
echo "Corriendo flussonicdailybkp.sh..."
./flussonicdailybkp.sh


###########################
# Llama al segundo script #
###########################
# Este copia el archivo anterior al repo de github 
echo "Corriendo copybkptogit.sh..."
./copybkptogit.sh


##########################
# Llama al tercer script #
##########################
# Este mueve el archivo de la raiz de github a la carpeta bkp_configfiles
echo "Corriendo movebkptofolder.sh..."
./movebkptofolder.sh


##########################
# Llama al cuarto script #
##########################
# Este elimina el archivo si sigue estando en la raiz del repo y chequea que no haya nada que no deba estar en la raiz
echo "Corriendo gitrmcheck.sh..."
./gitrmcheck.sh

echo "¡Todos los scripts han sido ejecutados correctamente!"