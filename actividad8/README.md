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

## Actividad 8 - Primeros pasos con K8s

1. Instalar un ambiente local de Kubernetes utlizando minikube, kind o Docker Desktop.

### Instalarar un entorno local con Docker Desktop

![Docker](./imagenes/docker-desktop.png)

### Activar Kubernetes en Docker Desktop

Para activar kubernetes se realizan una serie de pasos que se presentan a continuación:

- Se hace clic en el icono de engraneje

![Engranaje](./imagenes/engranaje.png)

- Se seleccina la opción kubernetes

![Kuber](./imagenes/kuber.png)

- Marca la casilla Enable Kubernetes (Habilitar Kubernetes).

![Restar](./imagenes/restar.png)

- Haz clic en Apply & Restart.

![Install](./imagenes/install.png)

Docker Desktop instalará Kubernetes y lo iniciará automáticamente. Para verificar que el kubernetes esta corriendo, se abre una terminal y se coloca el comando `kubectl get nodes`

![Comando1](./imagenes/comando1.png)

### Desplegar un contenedor de algun web server, apache o nginx por ejemplo, en el Cluster de K8s Local.

Para desplegar un contenedor web server en este caso elegimos nginx se realizó los sigueintes pasos:

- Ejecutar el siguiente comando para crear un deployment de NGINX:

![Deployment](./imagenes/deployment.png)

- Para que el servidor NGINX sea accesible desde fuera del clúster, se debe de exponer el deployment:

![Comando2](./imagenes/comando2.png)

El tipo de servicio LoadBalancer expone el servicio de manera externa, lo cual Docker Desktop maneja internamente.

- Docker Desktop asigna automáticamente una IP local al servicio. Para obtener la URL o puerto de acceso, usa el siguiente comando:

![Comando3](./imagenes/comando3.png)

- Una vez se obtiene el puerto asignado, se accede al servidor NGINX desde el navegador:

![Servicio](./imagenes/servicio.png)

- Luego como ultimo paso verificamos en docker desktop que el cluster y el deployment estan corriendo correctamente:

![Services](./imagenes/services.png)

### Contestar a siguiente pregunta.¿En un ambiente local de Kubernetes existen los nodos masters y workers, como es que esto funciona?

En un ambiente local de Kubernetes, como en Docker Desktop, tanto los nodos master como worker están emulados en una única máquina. 

El nodo master gestiona el clúster, programando las aplicaciones y manteniendo el estado del sistema, mientras que los nodos worker ejecutan los contenedores. Todo ocurre en un entorno virtualizado.