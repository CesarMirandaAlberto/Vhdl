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
+ Dado que todas las entidades estan en la misma carpeta no es necesario modificar la ruta de compilado de los archivos


## ⚙️Instrucciones de código de plantilla ⚙️
La plantilla se puede adaptar a múltiples diseños con diferente nivel estructural solo es cuestion de modificar las
entidades con su extensión.vhd que requiere el módulo top.
+ 1.- La archivo  `.bat` se puede modificar con notepad para ajustar los diseños acorde al módulo top
+ 2.- Para ejecutar la plantilla se puede hacer dando doble click en ella.

