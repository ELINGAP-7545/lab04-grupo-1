# lab04

* Jaider Neira
* Sergio Obando
* Julian Diaz

BCD2SSeg

# Introducción


realizamos cambios para visualizar en simulacion el estado con 7 segmentos y observar el cambio de numeracion en decimal.

clonamos el proyecto y miramos los posibles cambios a realizar desde el codigo fuente hasta el testbench, 

estos cambios que realizamos son para ver que hace cada funcion o que puede realizar.

Realizamos comentarios en el codigo para que sea mas entendible y asi poder explicarlo de una manera facil.

## Diseño BCD-7seg

En este punto, ya se estar en la capacidad de describir e implementar Hardware sencillo, con la ayuda de herramientas computaciones.  y como se vio en los dos ejemplos anteriores, la suma se visualiza en leds,  algo que es difícil para  validar visualmente la respuesta. Por lo tanto, es aconsejable tener una visualización mas acorde a las necesidades, como por ejemplo  visualizar los resultados en el [ Display 7 Segmentos](https://en.wikipedia.org/wiki/Seven-segment_display) 

En este Ejercicio se propone que realicen el diseño, sintentización e implementación del Display de 7 sergmentos, el cual permita visualizar números  en representación hexadecimal (0x0 a 0xF).  En el siguiente gráfico, se observa cual es el funcionamiento deseado del display:

anodo comun este funciona con una señal de 1 mostrara una luz indicando de esta forma podremos ver que si colocamos otro 1 podremos ver un numero en decimal como se muestra en la imagen 

de esta forma si tenemos en binario 0000110 nos mostrara un 1 en decimal 


![gif display](https://upload.wikimedia.org/wikipedia/commons/2/2b/Seven_segment_display-animated.gif)


A continuación se presentan los pasos recomendados para el ejercicio:

**Definir la caja funcional del BCD**: 

![bcd_black](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab03-BCD2SSeg/doc/BCD2SSeg.jpg)


## Primer Entregable

[Codigo](hdl/Lab4/BCDtoSSeg/BCDtoSSeg.v)


## Segundo Entregable

Se realiza montaje de simulacion se deja imagen 

![diagrama](https://github.com/ELINGAP-7545/lab04-grupo-1/blob/master/Imagenes/simulador.jpeg)

## Tercer Entregable

![Capture3](https://github.com/ELINGAP-7545/lab04-grupo-1/blob/master/Imagenes/Captura3.PNG)

## Diagrama Caja negra 

Como siempre, antes de realizar la descripción del hardware se debe diseñar la caja funcional del modulo, con las entradas y salidas

![diagrama caja negra ](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/doc/display_7segx4.jpg)

En este sentido, se adiciona al HDL de siete segmentos 4 señales de control para el LCD, llamadas An. cada bit de la señal `An` debe ser modificado en el tiempo, con el fin de activar solo un display.  

## Diagrama Estructural 

![estructural](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/doc/display_7segx4_Diag_Estructural.jpg)

Se evidencia que se deben construir cuatro módulos  básicos, de los cuales uno de ellos esta descrito en el ejercicio anterior, [BCDtoSSeg.v](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/src_ise_basys2/display_7segx4/BCDtoSSeg.v) . Los otros tres bloques son:

* Divisor de frecuencia: Su función es dividir la frecuencia de  `clk` de entrada, en el tiempo requerido para cada camvio de ánodo
* Selector de Ánodo: Sincronizado con la frecuencia  que genera el divisor, cambia en cada instante de tiempo el  ánodo, se puede ver como un registro de desplazamiento del bit 0 `1110 1101 1011 0111`
* Selector de Datos: dependiendo del ánodo activado, activa los datos correspondientes.

# Entregamos

* Imagen de visualizacion o simulacion.
* Realizamos modificaciones para el proyecto y realizar una visualizacion dinamica.
* modificacion testbench.

