# 📱 CALCULADORA DE 4 BITS 📱

El proyecto implementa el desarrollo de una calculadora de 4 bits la cual ejecuta la suma, resta y multiplicación a la vez <br>  que se muestra en display 7 segmentos el valor de las entradas y el resultado de las operaciones. <br> El valor de las entradas X e Y es exhibido en formato hexadecimal mientras que el resultado esta en formato decimal en unidades, decenas y centenas. Por cuestion de hardware del FPGA ya que si los valores de las entradas se mostrarán en decimal no tiene los displays suficientes.

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
El proyecto se realizó a nivel estructural y se instancian diferentes módulos ya desarrollados con anterioridad. <br>

