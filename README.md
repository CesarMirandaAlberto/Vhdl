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

# Para utilizar algún estándar de vhdl ej. 2008
ghdl -a --std=08 Midiseño.vhd
ghdl -a --std=08 Midiseño_TB.vhd
ghdl -e --std=08 .....
ghdl -r --std=08 ....
```

## ⚠️ Los códigos presentados en este repositorio estan desarrollados bajo el estandar vhdl 2008 ⚠️ 
Los módulos fueron desarrollados bajo este estandar por lo que si no se especifica algunos de los comandos o librerias puede que no esten disponibles en otros estandares diferentes por lo que puede generar errores en los compilados ❌ .

### ⚙️  Para automatización de compilado y simulación 💻📉 
A medida que los diseños se vuelven más complejos y requieren instanciación de múltiples entidades, es necesario que todas estas sean compiladas previo a la compilación del diseño principal.<br>
Para automatizar el proceso, en algunos de los proyectos se incluyen archivos `.bat` que permiten compilar, ejeutar la simulación de forma automatica.<br>
En el repositorio 🔗 [FPGA-Scripts-Automatización](https://github.com/CesarMirandaAlberto/FPGA-Scripts-Automatizacion.git) se explican a detalle los casos en que se aplica cada plantilla. <br>
### ⚠️ Leer readme de cada nivel ⚠️
Dado que varios de los módulos instancian el mismo diseño, para evitar redundancia y subir códigos repetidos se especifican que plantilla es la adecuada para compilar y visualizar los módulos, por ejemplo el sumador de 4 bits que instancia al sumador completo y a su vez al medio sumador todos estos diseños deben de estar en la misma carpeta que el módulo top por lo que por consecuente se duplicarian los códigos.
