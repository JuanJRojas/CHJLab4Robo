# G3-CHJ-Lab4Robo
Laboratorio 3 curso de robótica
### Nombres

-Hector Daniel Vargas

-Juan José Rojas Álvarez

-Christian Cuestas

### Solución del problema
En el laboratorio se plantea el uso del ambiente de ROS, Robot Operating System para el movimiento del brazo robótico PhantomX Pincher a partir de Dynamixel One Motor, se realizó una interfaz de usuario para modificar los valores articulares del brazo por medio de un slider, además se adicionaron 5 botones para 5 poses predeterminadas, una imagen del HMI se encuentra a continuación

<p align="center">
  <img src="https://github.com/JuanJRojas/CHJLab4Robo/blob/main/Imágenes y video/Lab3.png"
       width="800"/>
</p>

Se optó por utilizar el entorno de Matlab para esto, junto al toolbox de ROS, con los comandos rosinit y rosshutdown, para la creación y destrucción del nodo maestro, rospublisher, rossubscriber y rossvcclient, para la creación de publicadores y suscriptores de temas así como de un objeto de servicio, como se muestra en la imagen siguiente:

<p align="center">
  <img src="https://github.com/JuanJRojas/G3-JJF-Lab3rob/blob/main/CodigoMatlab.png"
       width="800"/>
</p>

Se modificaron la pose relativa y la velocidad y creó un ciclo for donde se dibujaba una figura cercana a la de un triángulo con el camino de la tortuga. El recorrido realizado se muestra en la siguiente imagen:

<p align="center">
  <img src="https://github.com/JuanJRojas/G3-JJF-Lab3rob/blob/main/TurtlePath.png"
       width="400"/>
</p>

En el repositorio se encuentran: 

-video del código en acción, encontrado en el link que se muestra a continuación [Video Laboratorio 3](https://youtu.be/XY7onDt0-YQ).

-Código de matlab usado.

-Imágenes mostradas dentro de este Read me.

### conclusiones

El ambiente de ROS puede llegar a ser confuso cuando no se lleva registro de todos los nodos, servicios y temas que se trabajan, por ello se recomienda el uso de notas o correr en el terminal rqt_graph, para llevar una imagen más visual de la interconexión entre nodos.

El control por medio de velocidad para la tortuga puede no entregar resultados esperados en posición si no se ejecuta de forma correcta, por lo que es preferible modificar la posición relativa o absoluta de la tortuga con su respectivo servicio.

Es recomendable borrar las suscripciones y servicios y publicaciones con el comando clear el Matlab, para asegurar la detención de las acciones por su parte. El comando para eliminar el nodo maestro en Matlab es rosshutdown y, de necesitar o desear correr el script desde 0, es preferible, ya sea desactivar el nodo maestro al final del script o en los comandos, o separar la creación del nodo maestro con partimiento de secciones ' %% ', debido a que, una vez creado el nodo maestro se presenta un error al correr la función rosinit de nuevo.
