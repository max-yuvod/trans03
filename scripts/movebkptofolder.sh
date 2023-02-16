#!/bin/bash
  
#Obtiene la fecha actual en formato AAAA-MM-DD
fecha=$(date +%F)

#Ruta del archivo de configuración backupeado anteriormente por el dailybkp.sh
ruta_archivo="/etc/flussonic/flussonicdailybkp/flussonic-$fecha.conf"

#Verificar si el archivo existe
if [ -f "$ruta_archivo" ]; then
  #Clona el repositorio en un directorio temporal
  temp_dir=$(mktemp -d)
  git clone git@github.com:max-yuvod/trans03.git "$temp_dir"

  #Mueve el archivo a la carpeta bkp del repo
  cp "$ruta_archivo" "$temp_dir/bkp_configfiles/"
  rm "$temp_dir/flussonic-$fecha.conf"
  rm "flussonic-$fecha.conf"
  cd "$temp_dir"
  git add bkp_configfiles/
  git commit -m "Agregado archivo de configuración flussonic-$fecha.conf"
  git push

  #Elimina el directorio temporal
  cd -
  rm -rf "$temp_dir"
  echo "Archivo movido exitosamente"
else
  echo "El archivo flussonic-$fecha.conf no existe"
fi
