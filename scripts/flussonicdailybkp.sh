#!/bin/bash
  
# Obtener fecha actual en formato año-mes-día
fecha=$(date +%F)

# Archivo de configuración a respaldar
archivo_configuracion="/etc/flussonic/flussonic.conf"

# Carpeta de destino para los respaldos
carpeta_destino="/etc/flussonic/flussonicdailybkp"

# Crear la carpeta de destino si no existe
if [ ! -d "$carpeta_destino" ]; then
  mkdir "$carpeta_destino"
fi

# Realizar el respaldo
cp "$archivo_configuracion" "$carpeta_destino/flussonic-$fecha.conf"

# Verificar si el respaldo se realizó correctamente
if [ $? -eq 0 ]; then
  # Enviar una notificación a Slack en caso de éxito
  curl -X POST -H 'Content-type: application/json' --data '{"attachments":[{"color":"good","title":"Backup Flussonic> yuvod-trans03.yuvod.net [45.84.210.128]","text":"Se realizo correctamente el respaldo diario del config file en la ruta /etc/flussonic/flussonicdailybkp y se subio al repo de github"}]}' https://hooks.slack.com/services/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
else
  # Enviar una notificación a Slack en caso de error
  curl -X POST -H 'Content-type: application/json' --data '{"attachments":[{"color":"danger","title":"Backup Flussonic> yuvod-trans03.yuvod.net [45.84.210.128]","text":"Error al realizar el respaldo diario en la ruta /etc/flussonic/flussonicdailybkp > y se subio al repo de github ARCHIVO NO ENCONTRADO > Se reintentara nuevamente"}]}' https://hooks.slack.com/services/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