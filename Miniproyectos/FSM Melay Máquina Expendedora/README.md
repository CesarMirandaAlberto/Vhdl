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
