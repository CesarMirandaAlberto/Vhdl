# VHDL
Este repositorio contiene diseños desarrollados en VHDL junto con sus respectivos testbenches para verificación funcional mediante simulación y pruebas físicas.

## 📁 Estructura del repositorio

El repositorio está dividido en distintos niveles de complejidad:

- **Básico:** Ejercicios fundamentales para comprender la sintaxis de VHDL y construir una base sólida.
- **Medio:** Diseños que aplican conceptos básicos en módulos prácticos como flip-flops, divisores de frecuencia, y máquinas de estados (FSM).
- **Avanzado:** Implementación de protocolos de comunicación utilizando los fundamentos de niveles anteriores.
- **Miniproyectos:** Aplicaciones prácticas que integran los conocimientos de todos los niveles.


## 🧪 Pruebas en simulación
Para la simulación de los códigos se desarrollaron en los softwares ghdl y gtkwave.
- **GHDL:** Compilar
- **GTKWAVE:** Visualizar señales y resultados.

## ⚙️ Pruebas en hardware
Los códigos que se presentan han sido puestos a prueba en físico en un FPGA DE10-Lite.

## - Conceptops Basicos de VHDL

## - **`library`** y **`use`**
Utilizados para incluir librerias del lenguaje.

## -**`entity`**
Define la interfaz del circuito (carcasa).

## - **`port(...)`**
Lista de puertos (entradas y salidas) de la entidad se especifica el tipo de dato y el ancho de los puertos.

## - **`architecture`**
Describe el funcionamiento de la entidad ademas se asignan operaciones a los puertos.

## - **`begin`** y **`end`**
Delimita al bloque en donde se escriben las instruciones del funcionamiento(logica combinacional, secuencial etc).

## **** Para Testbech ****

## - **`Signal`**
Señales internas del testbench para comunicar entre la entidad a verificar y el testbench.

## - **`Componente`**
Declaración local de las entidadades locales que se van a verificar.

## - **`Instaciación`**
Incluye entidades externas al testbench y poder analizar su funcionamiento.

## - **`Mapeo`**
Conecta las señales del testbench con los puertos de la entidad (conectar los  pines de un microcontrolador a un cable).

## - **`Estimulos`**
Aplican señales a las entradas para analizar el comportamiento. (Es como aplicar voltajes en el circuito y analizar como trabaja).
