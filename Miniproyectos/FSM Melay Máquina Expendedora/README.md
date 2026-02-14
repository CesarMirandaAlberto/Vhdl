# 🏪 MÁQUINA EXPENDEDORA 🏪

 El presente proyecto implementa el desarrollo de una Máquina de Estados de MEELAY el cual simula una máquina expendedora de productos, en esta máquina de estados simula el ingresar monedas por parte del usuario, estas monedas pueden ser de 2 diferentes denomicaciones 5 ó 10 al tiempo en que se ingresa la moneda se muestra en display 7 segmentos el valor de la moneda ingresada. Se cuenta con un límite de dinero que se puede ingresar el cual es 20 y al mismo tiempo si este se alcanza se entregará cambio y el producto. Para entregar el cambio y el producto es necesario presionar el boton de entrega, para este caso tanto el cambio como el producto se simula con 2 led para simular la entrega.

 # ORGANIZACIÓN DEL PROYECTO
📂 rtl : Contiene los módulos .vhdl del proyecto. <br>
📂 quartus : Contiene los scripts tcl para bajar el diseño mediante quartus. <br>

# EJECUTABLES
Se incluyen 2 ejecutables en la carpeta: <br>
 Compilar_Simular : Compila el diseño mediante ghdl, simula y visualiza mediante GTKWave.<br>
 Bajar_AFPGA :  Baja el diseño al FPGA.<br>

 # ⚠️ ! ACERCA DE LOS MODULOS TOP ! ⚠️
 Modulo_Top.vhd : Es el módulo top a nivel rtl del proyecto. <br>
 Top.vhd : Es el módulo top a nivel de hardware el cual se encarga de enlazar pines físicos del FPGA con puertos del diseño.

# 📃 ! ACERCA DEL PROYECTO ! 📝🎯
Para que la máquina de estados funcione de manera óptima se requiere el desarrollo de diferentes módulos entre los cuales se encuentran lo siguientes: <br>

* FSM_Expendedora : Contiene toda la lógica y funcionamiento de la máquina de estados únicamente contiene únicemente transiciones, actualizaciones, y salidas de los estados. <br>
* Divisor_Frecuencia : Genera un pulso de reloj de 1 hz partiendo de los 50 mhz que contiene el FPGA.
* PresionarBoton : Implementa Antirrebote, reloj de baja frecuencia  y detector de flancos para utilizar push buttons.
* Double Dabble : Algoritmo que separa un digito en binario en 2 diferentes para asi poder trabajar con dos dígitos. ej. 47 digitos 4 Y 7.
* DecoderBCD_7Seg : Partiendo de los valores generados por el Double Dabble y posteriormente son utilizados por el decoder para exhibirlos en display 7 segmentos.
* FSM_Expendedora_TB : Implementa el testbench para analizar el funcionamiento general de la máquina de estados.

# ⚠️ 💻! ACERCA DEL TESTBENCH !📈 ⚠️
Dado que se implementan módulos como presionar boton los valores de los exhibidores en display 7 segmentos no se puede mostrar por completo dado que el tiempo de simulación es muy corto, sin embargo si se quiere visualizar se debe modificar el tiempo de los retardos o su escala de tiempo, sin embargo el tiempo que tardará en generarse la simulación será mayor.

🔗 [VIDEO DE CÓDIGO BAJADO AL FPGA](https://youtu.be/PaWDgkV6XBQ?si=1JDhieSJg_DtLMsU)
