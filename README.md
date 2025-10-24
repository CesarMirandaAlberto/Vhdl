# VHDL
Este repositorio contiene diseños desarrollados en VHDL junto con sus respectivos testbenches para verificación funcional mediante simulación y pruebas físicas.

## 📁 Estructura del repositorio

El repositorio está dividido en distintos niveles de complejidad:

- 📂 **Básico:** Ejercicios fundamentales para comprender la sintaxis de VHDL y construir una base sólida.
- 📂 **Medio:** Diseños que aplican conceptos básicos en módulos prácticos como flip-flops, divisores de frecuencia, y máquinas de estados (FSM).
- 📂 **Avanzado:** Implementación de protocolos de comunicación utilizando los fundamentos de niveles anteriores.
- 📂 **Miniproyectos:** Aplicaciones prácticas que integran los conocimientos de todos los niveles.


## 🧪 💻 Pruebas en simulación
Para la simulación de los códigos se desarrollaron en los softwares ghdl y gtkwave.
- **GHDL:** Compilar las entidades y testbench.
- **GTKWAVE:** Visualizar señales y resultados en forma de onda.

## ⚙️ Pruebas en hardware
Los códigos que se presentan han sido puestos a prueba en físico en un FPGA DE10-Lite.

## 💻 Comandos para compilar y simular las entidades 

```bash
# Compilar entidades con ghdl
ghdl -a Midiseño.vhd
ghdl -a Midiseño_TB.vhd

#Elaborar la simulacion de la entidad
ghdl -e Midiseño_TB

#Ejecutar simulación y generar el archivo vcd 
ghdl -r Midiseño_TB --vcd=Testbench.vcd

# Visualizar testbench en forma de onda
gtkwave Testbench.vcd 

```
# ⚙️ 💻🧪 Para automatización de compilado y simulación
A medida que los diseños se vuelven más complejos y requieren instanciación de múltiples entidades, es necesario que todas estas sean compiladas previo a la simulación.
Para automatizar el proceso, en algunos de los proyectos se incluyen archivos `.bat` que permiten compilar, ejeutar la simulación de forma automatica.
Además, se adjunta en este repositorio una plantilla de archivo `.bat` que puede adaptarse a otros diseños si es necesario.
