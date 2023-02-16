#!/bin/bash
  
# Obtiene la fecha actual en formato AAAA-MM-DD
fecha=$(date +%F)

# Nombre del archivo a buscar y eliminar
archivo="flussonic-$fecha.conf"

# Clona el repositorio en un directorio temporal
temp_dir=$(mktemp -d)
git clone git@github.com:max-yuvod/trans03.git "$temp_dir"

# Verifica si existe el archivo en la raíz del repositorio
ruta_archivo="$temp_dir/$archivo"
if [ -f "$ruta_archivo" ]; then
  # Elimina el archivo en la raíz del repositorio
  rm "$ruta_archivo"
  cd "$temp_dir"
  git add .
  git commit -m "Eliminado archivo de configuración $archivo"
  git push
  echo "Archivo $archivo eliminado exitosamente"
else
  echo "El archivo $archivo no existe en la raíz del repositorio"
fi

# Elimina el directorio temporal
rm -rf "$temp_dir"
