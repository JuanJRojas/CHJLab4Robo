# G3-CHJ-Lab4Robo
Laboratorio 3 curso de robótica
### Nombres

-Hector Daniel Vargas

-Juan José Rojas Álvarez

-Christian Cuestas

### Solución del problema
En el laboratorio se plantea el uso del ambiente de ROS, Robot Operating System para el movimiento del brazo robótico PhantomX Pincher a partir de Dynamixel One Motor, se realizó una interfaz de usuario para modificar los valores articulares del brazo por medio de un slider, además se adicionaron 5 botones para 5 poses predeterminadas, una imagen del HMI se encuentra a continuación

<p align="center">
  <img src="https://github.com/JuanJRojas/CHJLab4Robo/blob/main/Imágenes y video/UI.png"
       width="600"/>
</p>

Se optó por utilizar el entorno de Matlab para esto, junto al toolbox de ROS y de Peter Corke, la interfaz gráfica permite el deslizamiento de los "slider" para modificar las primeras 4 articulaciones del robot. Además se presentan 6 botones, 5 de los cuales son "Home" y pose de 1 a 4. Estos botones modifican el valor de los slider para encontrarse en las posiciones predeterminadas de home y las cuatro poses con ángulos desde home determinadas en la guía, que corresponden a los valores que se muestran a continuación:

1. (0 0 0 0 0)

2. (-25, 15, -20, 20, 0)

3. (35, -35, 30, -30, 0)

4. (-85, 20, -55, 17, 0)

5. (-80, 35, -55, 45, 0)

Para poder hacer uso del toolbox de robótica de Peter Corke se realizó la tabla de parámetros según la convención de Denavit Hartenberg, el resultado se muestra en la imagen a continuación.

Posteriormente se obtuvo los resultados de posición para el brazo dados los movimientos angulares en la guía, estos se muestran en las imágenes a continuación:

||||||
|---|---|---|---|---|
|https://github.com/JuanJRojas/CHJLab4Robo/blob/main/Im%C3%A1genes%20y%20video/HomeUI.png|https://github.com/JuanJRojas/CHJLab4Robo/blob/main/Im%C3%A1genes%20y%20video/Pose1UI.png|https://github.com/JuanJRojas/CHJLab4Robo/blob/main/Im%C3%A1genes%20y%20video/Pose2UI.png|https://github.com/JuanJRojas/CHJLab4Robo/blob/main/Im%C3%A1genes%20y%20video/Pose3UI.png|https://github.com/JuanJRojas/CHJLab4Robo/blob/main/Im%C3%A1genes%20y%20video/Pose4UI.png|

Para el uso de Matlab, se utilizó una función de publicar, que se adaptó a Matlab desde Python del código encontrado en el código [fegonzalez7]([https://link-url-here.org](https://github.com/fegonzalez7/dynamixel_one_motor.git)). Este código adaptado a matlab se encuentra en el siguiente [link]([https://github.com/JuanJRojas/CHJLab4Robo/blob/main/dynamixel_one_motor/scripts/joint_publisher.m))

El resultado se encuentra en las figuras que se muestran a continuación

||||||
|---|---|---|---|---|
|https://github.com/JuanJRojas/CHJLab4Robo/blob/main/Im%C3%A1genes%20y%20video/Home.jpeg|https://github.com/JuanJRojas/CHJLab4Robo/blob/main/Im%C3%A1genes%20y%20video/Pose1.jpeg|https://github.com/JuanJRojas/CHJLab4Robo/blob/main/Im%C3%A1genes%20y%20video/Pose2.jpeg|https://github.com/JuanJRojas/CHJLab4Robo/blob/main/Im%C3%A1genes%20y%20video/Pose3.jpeg|https://github.com/JuanJRojas/CHJLab4Robo/blob/main/Im%C3%A1genes%20y%20video/Pose4.jpeg|

En el repositorio se encuentran: 

-video del código en acción, encontrado en el link que se muestra a continuación [Video Laboratorio 4](https://youtu.be/hrOJo8k3zDY).

-Carpeta de dynamixel one motor utilizada para la comunicación con el Phantom X, donde en los scripts se encuentran las modificaciones realizadas para el uso de Matlab.

-Imágenes mostradas dentro de este Read me, dentro de la carpeta de imágenes y video.

### conclusiones

El ambiente de ROS puede llegar a ser confuso cuando no se lleva registro de todos los nodos, servicios y temas que se trabajan, por ello se recomienda el uso de notas o correr en el terminal rqt_graph, para llevar una imagen más visual de la interconexión entre nodos.

El control por medio de velocidad para la tortuga puede no entregar resultados esperados en posición si no se ejecuta de forma correcta, por lo que es preferible modificar la posición relativa o absoluta de la tortuga con su respectivo servicio.

Es recomendable borrar las suscripciones y servicios y publicaciones con el comando clear el Matlab, para asegurar la detención de las acciones por su parte. El comando para eliminar el nodo maestro en Matlab es rosshutdown y, de necesitar o desear correr el script desde 0, es preferible, ya sea desactivar el nodo maestro al final del script o en los comandos, o separar la creación del nodo maestro con partimiento de secciones ' %% ', debido a que, una vez creado el nodo maestro se presenta un error al correr la función rosinit de nuevo.
