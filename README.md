# VHDL
Este repositorio contiene diseños desarrollados en VHDL junto con sus respectivos testbenches para verificación funcional mediante simulación y pruebas físicas. Cada una de las pruebas físicas han sido implementadas en un FPGA **DE10-Lite**.

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

### 💻 Comandos para compilar y simular las entidades 

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

# Para utilizar algun estandar
```
### ⚙️  Para automatización de compilado y simulación 💻
A medida que los diseños se vuelven más complejos y requieren instanciación de múltiples entidades, es necesario que todas estas sean compiladas previo a la compilación del diseño principal.<br>
Para automatizar el proceso, en algunos de los proyectos se incluyen archivos `.bat` que permiten compilar, ejeutar la simulación de forma automatica.<br>

### ⚠️ Leer readme de cada nivel ⚠️
Dado que varios de los diseños instancian el mismo diseño, para evitar redundancia y subir los mismos diseños se desarrollan dos plantillas genericas para los siguientes casos, dentro de estos readme se encuentra la explicación de las plantillas de los `.bat`.

+ 1.- Diseños donde tanto la entidad principal como las que se instanciarán estan en la misma carpeta.
+ 2.- Diseños donde la entidad principal se encuentra en una carpeta diferente al de las entidades a instancias.
