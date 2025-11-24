# ⚙️  Para Automatización de Compilado ⚙️ 

Dado que algunos de los diseños de este repositorio estan desarrollados a nivel estructural
y se requiere la instanciación de entidades previamente diseñadas y compiladas los comandos 
que se ejecutan en el CLI van aumentando.
Se desarrolla un plantilla `.bat` para automatizarse el compilado. 

## 📁📁 PLANTILLA PARA ARCHIVOS EN MISMA CARPETA 📁📁
La plantilla esta orientada para diseños que tienen múltiples entidades en la misma carpeta en este caso el sumador de 4 bits
   + -📁 Vhdl
   + --📁-📁 Basico
   +          Entidades.vhd
+ Dado que todas las entidades estan en la misma carpeta como en este repositorio no es necesario modificar la ruta de los archivos, por lo que la compilación de las entidades es normal. 


## ⚙️Instrucciones de código de plantilla ⚙️
La plantilla se puede adaptar a múltiples diseños con diferente nivel estructural solo es cuestion de modificar las
entidades con su extensión.vhd que requiere el diseñotop.
