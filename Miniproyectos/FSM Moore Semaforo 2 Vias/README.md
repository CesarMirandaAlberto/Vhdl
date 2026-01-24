# 🚦 SEMAFORO DE 2 VIAS 🚦

El presente proyecto implementa el diseño de una máquina de estados de tipo moore aplicada a un semáforo de 2 vias. <br>

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
 La máquina de estados requiere de múltiples funcionalidades para trabajar entre las cuales están : <br>
 Divisor de frecuencia : Para generar el parpadeo de los leds.<br>
 Contador : Tener un control del tiempo que permanecerán encendidos los leds.<br>
 FSM_Semaforo2V : Contiene estados, tranciciones de la FSM, (SOLO LOGICA DE LA FSM). <br>
 Modulo_Top : Conecta todos los módulos utilizados en un solo diseño. <br>
 FSM_Semaforo2V_TB : Genera el testbench para analizar el funcionamiento completo de la FSM.<br>

 Para evitar tener un código demasiado largo se opto por modularizar el proyecto a fin de facilitar el desarrollo.

 La función del proyecto es desarrollar 2 semaforos los cuales estan sincronizados entre si para determinar cuál tiene el paso y en que momento.
 