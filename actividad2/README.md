<p> Universidad de San Carlos de Guatemala </p>
<p> Facultad de Ingeniería </p> 
<p> Escuela de Ciencias y Sistemas </p>
<p> Sistemas Operativos 1 </p>
<p> Segundo Semestre 2024 </p>
<p> Catedrático: Jesús Alberto Guzmán Polanco </p>

### Datos Personales:
Nombre                              | Carnet
----------------------------------- | -------------
Hesban Amilcar Argueta Aguilar      | 201704787

### Actividad 2 - Creación de Script

### Scripting

Crear un script de Bash que realice lo siguiente:

- Leer la variable GITHUB_USER

- Consultar la URL `https://api.github.com/users/` concatenando el valor de la variable GITHUB_USER al final

- Imprime el mensaje
    ```bash
    Hola <github_user>. User ID: <id>. Cuenta fue creada el: <created_at>.
    ```

- Crea un log file en `/tmp/<fecha>/saludos.log` con la salida del mensaje anterior. Donde `<fecha>` corresponde a la fecha del dia de ejecución del script.

### Script

Se puede verificar el script en: [Script](./actividad2.sh)

```bash
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
```
### Log file luego de la ejecución del script

![Ejecución del log file](./imagenes/imagen1.png)

### Cronjob

Se crea un cronjob para que el script se ejecute a cada 5 minutos.

```bash
*/5 * * * * cd /home/hesban/Documentos/actividad2; ./actividad2.sh;
```

Mostrando lo siguiente:

![Crontab](./imagenes/imagen2.png)

### Comentarios

