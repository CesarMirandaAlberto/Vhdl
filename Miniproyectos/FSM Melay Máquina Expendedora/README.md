# 🏪 MÁQUINA EXPENDEDORA 🏪

 El presente proyecto implementa el desarrollo de una Máquina de Estados de MEELAY el cual simula una máquina expendedora de productos.

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
 