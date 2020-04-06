# lab04

**Jaider Neira
**Sergio Obando
**Julian Diaz

BCD2SSeg

# Introducción


En este paquete de trabajo los estudiantes deben familiarizarce con el  framework de trabajo de la FPGA seleccionado, a partir de la descripción dedecodificador BCD2SSeg

Para este paquete de trabajo, deben estar inscrito en un grupo y clonar la información del siguiente link [WP04](https://classroom.github.com/g/zCBwHHKX). Una vez aceptado el repositorio debe descargarlo en su computador, para ello debe clonar el mismo. Si no sabe cómo hacerlo revise la metodología de trabajo, donde se explica el proceso

Las documentación deben estar diligencia en el archivo README.md del repositorio clonado.

Una vez clone el repositorio, realice lo siguiente:

## Diseño BCD-7seg

En este punto, ya se estar en la capacidad de describir e implementar Hardware sencillo, con la ayuda de herramientas computaciones.  y como se vio en los dos ejemplos anteriores, la suma se visualiza en leds,  algo que es difícil para  validar visualmente la respuesta. Por lo tanto, es aconsejable tener una visualización mas acorde a las necesidades, como por ejemplo  visualizar los resultados en el [ Display 7 Segmentos](https://en.wikipedia.org/wiki/Seven-segment_display) 

En este Ejercicio se propone que realicen el diseño, sintentización e implementación del Display de 7 sergmentos, el cual permita visualizar números  en representación hexadecimal (0x0 a 0xF).  En el siguiente gráfico, se observa cual es el funcionamiento deseado del display:


![gif display](https://upload.wikimedia.org/wikipedia/commons/2/2b/Seven_segment_display-animated.gif)

Imagen tomada de [User:Guam + Various](https://commons.wikimedia.org/wiki/File:Seven_segment_display-animated.gif)

A continuación se presentan los pasos recomendados para el ejercicio:

**Definir la caja funcional del BCD**: 

![bcd_black](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab03-BCD2SSeg/doc/BCD2SSeg.jpg)


**Definir la descripción Funcional**

Para ello recuerde  que puede hacer uso, bien sea, de las tablas de verdad o de la descripción algorítmica del BCD a  siete segmentos. Recuerde que cada Segmento es una salida  del diseño. Ejemplo, si desea  visualizar el número **1**, la salida seria  de `Sseg es 0110000`. observe la gráfica a continuación, para generar las salidas acorde al número de entrada.

![sseg](https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/7_segment_display_labeled.svg/1024px-7_segment_display_labeled.svg.png)


* Definir en  HDL el comportamiento del sistema ** :  Use Verilog para hacer la descripción funcional
**simulación de Sistema** :  Use el Testbench para este fin.


# Ejercicio - Visualización Dinámica 4 Display

## Primer Entregable

`module BCDtoSSeg (BCD, SSeg, an);

  input [3:0] BCD;
  output reg [0:6] SSeg;
  output [3:0] an;

assign an=4'b1110;


always @ ( * ) begin
  case (BCD)
   4'b0000: SSeg = 7'b0000001; // "0"  
	4'b0001: SSeg = 7'b1001111; // "1" 
	4'b0010: SSeg = 7'b0010010; // "2" 
	4'b0011: SSeg = 7'b0000110; // "3" 
	4'b0100: SSeg = 7'b1001100; // "4" 
	4'b0101: SSeg = 7'b0100100; // "5" 
	4'b0110: SSeg = 7'b0100000; // "6" 
	4'b0111: SSeg = 7'b0001111; // "7" 
	4'b1000: SSeg = 7'b0000000; // "8"  
	4'b1001: SSeg = 7'b0000100; // "9" 
   4'ha: SSeg = 7'b0001000;  
   4'hb: SSeg = 7'b1100000;
   4'hc: SSeg = 7'b0110001;
   4'hd: SSeg = 7'b1000010;
   4'he: SSeg = 7'b0110000;
   4'hf: SSeg = 7'b0111000;
    default:
    SSeg = 0;
  endcase
end

endmodule`

## Segundo Entregable

Se realiza montaje de simulacion se deja imagen 

![diagrama](https://github.com/ELINGAP-7545/lab04-grupo-1/blob/master/Imagenes/simulador.jpeg)


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

# Entregables

Una vez clone el repositorio y lea la anterior guia, realice lo siguiente:

En el paquete de trabajo [WP04](https://classroom.github.com/g/zCBwHHKX)   esta la descripción del hardware que se implementa para visualizar un número hexadecimal de 32 bits en un display  y en 4 display de 7 segmentos.

* Comprenda cada línea del código HDL de los  archivos que se encuentra en la carpera src. Si cree necesario realice los respectivos comentarios en el mismo archivo y comente
* Realice en quartus la simulación para el BCD-7seg, analice los resultados.
* Cree el nuevo proyecto HDL para Visualización Dinámica 4 Display, tomando como base los archivos dados.
* Creer el archivo testbench.v
* Genera la simulación, Revise que el sistema funciona como usted lo esperaba. Realice lo comentarios necesarios en el archivo README.md.
* Modificar o Añadir los bloques necesarios para que la visualización sea en representación Decimal y no Hexadecimal.
* Realice la respectiva publicación del repositorio antes de la fecha dada con todo el código  fuente 


