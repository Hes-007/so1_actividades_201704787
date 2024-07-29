#!/bin/bash

# Pide el nombre de usuario de GitHub y lo lee
echo "Ingrese su username de github:"
read GITHUB_USER

# Verifica si se ingresó un nombre de usuario
if [ -z "$GITHUB_USER" ]; then
  echo "No se ingresó un nombre de usuario. Saliendo..."
  exit 1
fi

# Se crea la variable de la URL de la API de GitHub
URL="https://api.github.com/users/${GITHUB_USER}"

# Consulta a la API de GitHub y extrae los valores necesarios
JSON_RESPONSE=$(curl -s "$URL")
user_id=$(echo "$JSON_RESPONSE" | jq -r '.id')
created_at=$(echo "$JSON_RESPONSE" | jq -r '.created_at')
login=$(echo "$JSON_RESPONSE" | jq -r '.login')

# Verifica si el usuario existe
if [ "$user_id" == "null" ]; then
  echo "Usuario no encontrado. Saliendo..."
  exit 1
fi

# Se crea la variable del saludo, que es el mensaje que se mostrará en la shell
saludo="Hola $login. User ID: $user_id. Cuenta fue creada el: $created_at."

# Muestra el saludo
echo "$saludo"

# Obtiene la fecha actual en formato YYYYMMDD
fecha=$(date +"%Y%m%d")

# Crea la carpeta de la fecha
mkdir -p "/tmp/$fecha"

# Crea y escribe el saludo en saludos.log
log_file="/tmp/$fecha/saludos.log"
echo "$saludo" >> "$log_file"

# Muestra el mensaje de éxito
echo "Mensaje impreso y guardado en $log_file"