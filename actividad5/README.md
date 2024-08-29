<p> Universidad de San Carlos de Guatemala </p>
<p> Facultad de Ingeniería </p> 
<p> Escuela de Ciencias y Sistemas </p>
<p> Sistemas Operativos 1 </p>
<p> Segundo Semestre 2024 </p>
<p> Catedrático: Jesús Alberto Guzmán Polanco </p>

### Datos Personales
Nombre                              | Carnet
----------------------------------- | -------------
Hesban Amilcar Argueta Aguilar      | 201704787

### Actividad 1 - Tipos de Kernel

En esencia, el kernel actúa como el puente entre el hardware y el software, gestionando recursos, proporcionando servicios y facilitando la interacción entre el usuario y el sistema. Su nombre, derivado del inglés y traducido como “núcleo”, refleja su posición central y crucial en la arquitectura de un sistema informático. 

Una de las características distintivas del kernel es su capacidad para proporcionar un entorno de ejecución seguro y protegido para los programas. Esto se logra mediante el uso de mecanismos de aislamiento y privilegios, que aseguran que cada proceso tenga acceso solo a los recursos asignados y no pueda interferir con otros procesos en ejecución. 

Los tipos de kernel son los siguientes:

- ### Kernel monolítico:

En este diseño, todas las funciones del kernel se implementan como un único programa en espacio de kernel. Ejemplos de sistemas operativos con kernels monolíticos son Linux y Windows (aunque Windows también incorpora aspectos de diseño híbrido). 

- ### Microkernel:

En contraste con el enfoque monolítico, un microkernel delega la mayoría de las funciones del kernel a procesos separados que se ejecutan en espacio de usuario. Esto reduce la complejidad del núcleo y facilita la extensibilidad y la modularidad del sistema operativo. Ejemplos de sistemas con microkernels son GNU Hurd y QNX. 

- ### Kernel híbrido:

Como su nombre sugiere, un kernel híbrido combina características de los kernels monolíticos y microkernels. Algunas funciones críticas se implementan en espacio de kernel, mientras que otras se ejecutan como procesos en espacio de usuario. Este enfoque busca combinar la eficiencia del kernel monolítico con la flexibilidad del microkernel. macOS es un ejemplo de sistema operativo que utiliza un kernel híbrido. 

- ### Nanokernel:

Es un kernel de tamaño muy pequeño (más pequeño que el microkernel), que se encarga de las tareas básicas de un sistema operativo. Es utilizado en sistemas embebidos.

- ### Exokernel:

Este kernel su estructura es innovadora ya que se encuentra de manera vertical. Los núcleos son pequeños y sui desarrollo tiene fines investigativos. En un exokernel la toma de decisiones está a cargo de los programas, para hacer uso de los recursos del harware en ciertas bibliotecas. El Kernel se limita a evitar errores en los permisos de hardware y eludir conflictos.

- ### Unikernel:

Es un kernel destinado a la eliminación de capas intermedias entre el harware y las aplicaciones, ya que busca simplificar lo más posible todos los procesos. Es habitual en dispositivos de bajo consumo como los IoT.

- ### Anykernel:

Este Kernel es otro concepto innovador que busca conservar las cualidades de los Kernel monolíticos, pero tambien facilitar el desarrollo de los controladores, al mismo tiempo que ofrece mayor seguridad al usuario

- ### Diferencias entre los principales Kernels

| Kernel Monolítico | Microkernel | Kernel Híbrido |
| --- | ---- | ---- |
| Mayor rapidez al ser un solo programa, ya que no necesita comunicarse con ningún proceso externo. | Este tipo de kernel divide las tareas del kernel en servidores, el código fuente tiende a estar mejor organizado. | Mayor facilidad en la integración de tecnologías de terceros. |
| Debido a que es un sólo componente de software, su código fuente al igual que el binario compilado tienden a ser pequeños. | La mejor organización del código hace que sea mucho más fácil darle mantenimiento. | Debido a la gran cantidad de interfaces con las que se debe lidiar, es más probable que exista algún tipo de bug en el sistema. |
| Usualmente el proceso de desarrollo es tedioso debido a que con frecuencia se debe reiniciar el sistema para poder probar las modificaciones en el kernel. | El proceso de desarrollo suele ser más ágil debido a que no se requiere de un reinicio total del sistema para probar el código nuevo. | Ágil proceso de desarrollo ya que al igual que con los microkernels, se pueden probar nuevas piezas de código sin necesidad de reiniciar el sistema. |
| Su relativa menor cantidad de código hace que sea menos probable que existan errores y por esto puede hacerlo más seguro. | La cantidad de memoria que suele requerirse para la ejecución del kernel tiende a ser mayor debido a la gran cantidad de servidores que se deben ejecutar para llevar a cabo las tareas. | 

## User vs Kernel Mode

- ### User Mode: 

El User Mode es el modo de operación en el que se ejecutan las aplicaciones de usuario. En este modo, el acceso a los recursos del sistema está restringido, de manera que las aplicaciones no pueden interactuar directamente con el hardware o acceder a áreas protegidas de la memoria.

- ### Kernel Mode:

El Kernel Mode es el modo privilegiado de operación del sistema operativo, donde el código tiene acceso completo a todo el hardware y a todas las instrucciones de la CPU. En este modo, el sistema operativo tiene control total sobre los recursos de la máquina, como la memoria, los dispositivos de E/S, y la CPU.

- ### User vs Kernel Mode

|Criterios|User Mode|Kernel Mode|
|---------|---------|-----------|
|**Acceso a recursos**|En el modo de usuario, el programa de aplicación no tiene acceso directo a los recursos del sistema ya que se debe hacer una llamada al sistema. |En el modo kernel, el programa tiene acceso directo y sin restricciones a los recursos del sistema.|
|**Interrupciones**|En el modo de usuario, un solo proceso falla si ocurre una interrupción.|En el modo Kernel, todo el sistema operativo podría disminuir si se produce una interrupción.|
|**Modos**|El modo de usuario también se conoce como modo no privilegiado, modo restringido o modo esclavo.|El modo de kernel también se conoce como modo maestro, modo privilegiado o modo de sistema.|
|**Espacio de dirección virtual**|En el modo de usuario, todos los procesos obtienen espacio de dirección virtual separado.|En el modo kernel, todos los procesos comparten un solo espacio de dirección virtual.|
|**Restricciones**|Si bien el modo de usuario necesita acceder a los programas del kernel ya que no puede acceder directamente a ellos.|Como el modo kernel puede acceder tanto a los programas de usuario como a los programas de kernel, no hay restricciones.|
|**Valor de bit de modo**|El bit de modo del núcleo es 1|El bit de modo del núcleo es 0|
|**Choque del sistema**|En el modo de usuario, se puede recuperar un bloqueo del sistema simplemente reanudando la sesión.|Un bloqueo del sistema en modo kernel es severo y hace las cosas más complicadas.|
|**Acceso**|Los programas de usuario pueden acceder y ejecutarse en este modo para un sistema determinado.|	Solo se permite la funcionalidad esencial para operar en este modo.|
|**Funcionalidad**|El modo de usuario es un modo de visualización estándar y típico, lo que implica que la información no se puede ejecutar por sí sola o hacer referencia a ningún bloque de memoria; necesita una interfaz de protocolo de aplicación ( API ) para lograr estas cosas.|El modo kernel puede referirse a cualquier bloque de memoria en el sistema y también puede dirigir la CPU para la ejecución de una instrucción, lo que lo convierte en un modo muy potente y significativo.|

## Interruptions vs Traps

- ### Interruptions (Interrupciones)

Las interrupciones son señales enviadas por hardware o software para alertar al procesador de que debe detener temporalmente su ejecución normal y atender un evento o condición especial. Las interrupciones permiten que el sistema operativo o un controlador de dispositivos gestione tareas externas, como la llegada de datos o la finalización de operaciones de E/S, sin que el procesador necesite estar monitoreando continuamente.

- ### Traps

Los traps son interrupciones generadas de forma deliberada por el propio procesador o el software cuando se necesita ejecutar una operación especial del sistema operativo, como una llamada al sistema (system call) o cuando se produce una excepción, como una división por cero.

- ### Interruptions vs Traps

|Aspecto|Interruptions|Traps|
|---------|---------|-----------|
|**Definicion**|Señales que interrumpen la ejecución normal del procesador para manejar eventos asíncronos externos o internos. |Señales internas que indican una condición especial, como una excepción o llamada al sistema.|
|**Origen**|Externo al procesador (hardware) o software que genera una interrupción.|Interno al procesador, generalmente provocado por el software o errores.|
|**Ejemplo de Eventos**|- Entrada del teclado <br> - Finalización de una operación de E/S <br> - Temporizador|- Llamadas al sistema <br> - Excepciones aritméticas <br> - Violaciones de acceso a memoria|
|**Sincronización**|Asíncrono: puede ocurrir en cualquier momento sin depender del flujo de ejecución del programa.|Síncrono: ocurre en un punto específico del programa, como una instrucción que genera una excepción o una llamada al sistema.|
|**Manejo**|Manejado por el kernel del sistema operativo a través de rutinas de manejo de interrupciones (Interrupt Service Routines, ISR).|Manejado por el kernel a través de manejadores de traps y excepciones.|
|**Finalidad**|Responder a eventos externos que requieren la atención del sistema, como E/S o temporización.|Solicitar la intervención del kernel para realizar tareas específicas o manejar errores.|
|**Prioridad**|Puede ser más alta o baja dependiendo del tipo de interrupción (prioridades asignadas a hardware).|Generalmente de prioridad alta porque indica una excepción o llamada al sistema que debe ser atendida de inmediato.|
|**Impacto en el Sistema**|Permite la multitarea, asegurando que el sistema responda a eventos del mundo exterior sin detener completamente la ejecución del programa actual.|	Puede detener temporalmente la ejecución del programa, pero usualmente es esperado o controlado por el sistema operativo.|
|**Requiere Guardar Estado**|Sí, el procesador guarda el estado del programa interrumpido para poder reanudarlo después de atender la interrupción.|Sí, el estado del programa se guarda para que el sistema operativo pueda manejar el trap y luego retomar la ejecución normal.|
|**¿Genera Cambio de Modo?**|Sí, generalmente cambia el procesador de User Mode a Kernel Mode para manejar la interrupción.|Sí, cambia a Kernel Mode para manejar la llamada al sistema o la excepción.|
|**Excepciones vs Traps**|Las interrupciones generalmente no son causadas por errores en el programa, sino por eventos normales.|Los traps pueden ser generados por errores como la división por cero o por una solicitud de servicios del kernel.|
