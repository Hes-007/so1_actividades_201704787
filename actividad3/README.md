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

## Actividad 3 - Crontrol de Accesos

### Parte 1. Gestión de Usuarios

- ### 1. Creación de usuarios 

    Crea tres usuarios llamados `usuario1`, `usuario2` y `usuario3`.

    ```bash
    sudo adduser usuario1
    sudo adduser usuario2
    sudo adduser usuario3
    ```

    Creación del `usuario1`:

    ![Creación del usuario1](./imagenes/img1.JPG)

    Creación del `usuario2`:

    ![Creación del usuario2](./imagenes/img3.JPG)

    Creación del `usuario3`:

    ![Creación del usuario3](./imagenes/img5.JPG)

- ### 2. Asignación de Contraseñas
    
    Establece una nueva contraseña para cada usuario creado
    
    Creación contraseña `usuario1`:

    ![Creación contraseña usuario1](./imagenes/img2.JPG)

    Creación contraseña `usuario2`:

    ![Creación contraseña usuario2](./imagenes/img4.JPG)

    Creación contraseña `usuario3`:

    ![Creación contraseña usuario3](./imagenes/img6.JPG)

- ### 3. Información de Usuarios

    Muestra la información de `usuario1` usando el comando `id`.

    ```bash
    id usuario1
    ```

    ![Información del usuario1](./imagenes/img7.JPG)

- ### 4. Eliminación de Usuarios

    Elimina `usuario3`, pero conserva su directorio principal.

    ```bash
    sudo deluser usuario3
    ```

    Eliminación del `usuario3`:

    ![Eliminación del usuario3](./imagenes/img8.JPG)

    El directorio del `usuario3` se conserva (`/home/usuario3`):

    ![Directorio del usuario3](./imagenes/img9.JPG)

### Parte 2. Gestión de Grupos

- ### 1. Creación de Grupos

    Crea un grupo llamado `grupo1` y `grupo2`.

    ```bash
    sudo addgroup grupo1
    sudo addgroup grupo2
    ```

    Creación del `grupo1`:

    ![Creación del grupo1](./imagenes/img10.JPG)

    Creación del `grupo2`:

    ![Creación del grupo2](./imagenes/img11.JPG)

- ### 2. Agregar Usuarios a Grupos

    Agrega `usuario1` a `grupo1` y `usuario2` a `grupo2`.

    ```bash
    sudo adduser usuario1 grupo1
    sudo adduser usuario2 grupo2
    ```

    Agregando el `usuario1` al `grupo1`:

    ![Agregando el usuario1 al grupo1](./imagenes/img12.JPG)

    Agregando el `usuario2` al `grupo2`:

    ![Agregando el usuario2 al grupo2](./imagenes/img13.JPG)

- ### 3. Verificar Membresía

    Verifica que los usuarios han sido agregados a los grupos utilizando el comando `groups`.

    ```bash
    groups usuario1
    groups usuario2
    ```

    Verificando la membresía del `usuario1`:

    ![Verificando la membresía del usuario1](./imagenes/img14.JPG)

    Verificando la membresía del `usuario2`:

    ![Verificando la membresía del usuario2](./imagenes/img15.png)

- ### 4. Eliminar Grupo

    Elimina `grupo2`.

    ```bash
    sudo delgroup grupo2
    ```

    Eliminación del `grupo2`:

    ![Eliminación del grupo2](./imagenes/img16.JPG)

### Parte 3. Gestión de Permisos

- ### 1. Creación de Archivos y Directorios

    - Como `usuario1`, crea un archivo llamado `archivo1.txt` en su directorio principal y escribe algo en él.

        ```bash
        su usuario1
        echo "archivo1.txt creado exitosamente" >> ./archivo1.txt
        ```

        Creación del `archivo1.txt`:

        ![Creación del archivo1.txt](./imagenes/img17.JPG)

        Verificando el contenido del `archivo1.txt`:

        ![Verificando el contenido del archivo1.txt](./imagenes/img18.JPG)

    - Crea un directorio llamado `directorio1` y dentro de ese directorio, un archivo llamado `archivo2.txt`.

        ```bash
        mkdir directorio1
        cd directorio1
        touch archivo2.txt
        ```

        Creación del `directorio1` y `archivo2.txt`:

        ![Creación del directorio1 y archivo2.txt](./imagenes/img19.JPG)

- ### 2. Verificar Permisos

    Verifica los permisos del archivo y directorio usando el comando `ls -l` y `ls -ld` respectivamente.

    ```bash
    ls -l archivo1.txt
    ls -ld directorio1
    ls -l ./directorio1/archivo2.txt
    ```

    Verificando los permisos del `archivo1.txt`:

    ![Verificando los permisos del archivo1.txt](./imagenes/img20.JPG)

    Verificando los permisos del `directorio1`:

    ![Verificando los permisos del directorio1](./imagenes/img21.JPG)

    Verificando los permisos del `archivo2.txt`:

    ![Verificando los permisos del archivo2.txt](./imagenes/img22.JPG)

- ### 3. Modificar Permisos usando `chmod` con Modo Numérico

    Cambia los permisos del `archivo1.txt` para que sólo `usuario1` pueda leer y escribir (permisos `rw-`), el grupo pueda leer (permisos `r--`) y nadie más pueda hacer nada.

    ```bash
    chmod 640 archivo1.txt
    ```

    Cambiando los permisos del `archivo1.txt`:

    ![Cambiando los permisos del archivo1.txt](./imagenes/img23.JPG)

- ### 4. Modificar Permisos usando `chmod` con Modo Simbólico

    Agrega permiso de ejecución al propietario del `archivo2.txt`.

    ```bash
    chmod u+x archivo2.txt
    ```

    Agregando permiso de ejecución al propietario del `archivo2.txt`:

    ![Agregando permiso de ejecución al propietario del archivo2.txt](./imagenes/img24.JPG)

- ### 5. Cambiar el Grupo Propietario

    Cambia el grupo propietario de `archivo2.txt` a `grupo1`.

    ```bash
    chgrp grupo1 archivo2.txt
    ```

    Cambiando el grupo propietario del `archivo2.txt`:

    ![Cambiando el grupo propietario del archivo2.txt](./imagenes/img25.JPG)

- ### 6. Configurar Permisos de Directorio

    Cambia los permisos del `directorio1` para que sólo el propietario pueda entrar (permisos `rwx`), el grupo pueda listar contenidos pero no entrar (permisos `r--`), y otros no puedan hacer nada.

    ```bash
    chmod 740 directorio1
    ```

    Cambiando los permisos del `directorio1`:

    ![Cambiando los permisos del directorio1](./imagenes/img26.JPG)

- ### 7. Comprobación de Acceso

    Intenta acceder al `archivo1.txt` y `directorio1/archivo2.txt` como `usuario2`. Nota cómo el permiso de directorio afecta el acceso a los archivos dentro de él.

    - Intento del `usuario2` de acceder al `archivo1.txt`:

        ![Intento del usuario2 de acceder al archivo1.txt](./imagemes/img27.JPG)

    - Intento del `usuario2` de acceder al `directorio1/archivo2.txt`:

        ![Intento del usuario2 de acceder al directorio1/archivo2.txt](./imagenes/img28.JPG)

- ### 8. Verificación Final

    Verifica los permisos y propietario de los archivos y directorio nuevamente con `ls -l` y `ls -ld`.

    ```bash
    ls -l archivo1.txt
    ls -ld directorio1
    ls -l ./directorio1/archivo2.txt
    ```

    - Verificando los permisos y propietario del `archivo1.txt`:

        ![Verificando los permisos y propietario del archivo1.txt](./imagenes/img29.JPG)

    - Verificando los permisos y propietario del `directorio1`:

        ![Verificando los permisos y propietario del directorio1](./imagenes/img30.JPG)

    - Verificando los permisos y propietario del `archivo2.txt`:

        ![Verificando los permisos y propietario del archivo2.txt](./imagenes/img31.JPG)

## Reflexión

- ### ¿Por qué es importante gestionar correctamente los usuarios y permisos en un sistema operativo?

    Porque en los sistemas operativos existe información bastante delicada e importante que ciertos usuarios no deben de saber, es por ello que se debe gestionar y delegar los correspondientes permisos a cada usuario que maneje el sistema operativo y con esto el usuario realizará sus funciones asignadas y no habrá ningún problema.

- ### ¿Qué otros comandos o técnicas conocen para gestionar permisos en Linux?

    ```bash
    chown # Este comando se utiliza para cambiar permisos tanto de archivos como directorios.
    chown # Se utiliza para cambiar el propietario y el grupo de archivos y directorios.
    chgrp # Este comando cambia el grupo de archivos y directorios.
    ```



