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

### Actividad 7 - Completely Fair Scheduler

<p style="text-align: justify;">
Describir las características principales y el funcionamiento del Completely Fair Scheduler (CFS) de Linux. 
</p>

#### **Descripción**

El Completely Fair Scheduler (CFS) es el de planificación predeterminado utilizado por el núcleo de Linux desde la versión 2.6.23. Su principal objetivo es ofrecer una distribución justa del tiempo de CPU entre los procesos, asegurando que cada uno reciba una porción equitativa del tiempo de procesamiento.


#### **Características Principales**

- **Equidad:** CFS se basa en la idea de distribuir de manera justa el tiempo de CPU entre todos los procesos. A diferencia de otros algoritmos que asignan prioridades estáticas o dinámicas, CFS utiliza un sistema donde todos los procesos tienen la misma oportunidad de ejecutarse.

- **Tiempo virtual:** Cada proceso tiene asociado un "tiempo virtual" que mide cuánto tiempo ha utilizado la CPU en comparación con los demás procesos. Este tiempo se utiliza para determinar cuál proceso debe ejecutarse a continuación. Cuanto menos tiempo haya utilizado un proceso, más prioridad tendrá para ejecutarse.

- **Árbol Rojo-Negro:** CFS utiliza una estructura de datos llamada "árbol rojo-negro" para mantener y ordenar los procesos en función de su tiempo virtual. Esta estructura permite insertar, eliminar y buscar procesos de manera eficiente, garantizando que el tiempo de planificación sea O(log N), donde N es el número de procesos en ejecución.

- **Comportamiento predecible:** CFS intenta evitar los problemas de latencia que se presentan en otros algoritmos, como los derivados de tener procesos que monopolizan la CPU durante mucho tiempo. Para ello, el algoritmo decide cuánto tiempo puede ejecutar un proceso antes de que se reevalúe su lugar en la cola.

- **Grupos de tareas:** CFS también permite agrupar tareas en "grupos de tareas" para que varias tareas dentro de un mismo grupo compartan equitativamente la CPU. Este mecanismo es útil en entornos con múltiples usuarios o servicios que necesitan compartir el mismo servidor.


#### Funcionamiento del CFS:

<p style="text-align: justify;">
El CFS mide el tiempo que un proceso ha ejecutado utilizando el concepto de tiempo virtual, que avanza más lentamente para procesos que consumen menos CPU y más rápido para procesos que la consumen más. Cada vez que el kernel evalúa qué proceso ejecutar a continuación, selecciona aquel con el tiempo virtual más bajo, lo que garantiza que los procesos que han usado menos CPU recientemente tengan más oportunidades de ejecutarse.
</p>

<p style="text-align: justify;">
El tiempo de ejecución de un proceso está controlado por el "mínimo tiempo de ráfaga", un valor que establece el límite máximo de tiempo que un proceso puede ejecutarse antes de que se deba hacer una nueva decisión de planificación. Después de cada ráfaga, el kernel compara el tiempo virtual de los procesos y decide cuál debe ejecutarse a continuación.
</p>

<p style="text-align: justify;">
En resumen, CFS busca repartir el tiempo de CPU de manera justa entre los procesos, ajustando dinámicamente el tiempo de ejecución de cada proceso con base en su consumo previo y empleando estructuras de datos eficientes para mantener un rendimiento óptimo.
</p>