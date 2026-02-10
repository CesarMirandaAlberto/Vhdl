# 📊 PWMW 📊

El proyecto implementa un módulo que genera una señal PWM que va aumentando o disminuyendo acorde a 2 botones "aumentar" y <br>"disminuir", al mismo tiempo que se muestra en display 7 segmentos el valor de la señal PWM y un led va ajustando su brillo <br> acorde al valor del duty. <br>

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
 Para el funcionamiento del proyecto este esta desarrollado en diferentes módulos con una función especifica entre los cuales se encuentran: <br>
* Divisor_Frecuencia : Genera un pulso de 1 hz para visualizar los cambios en los displays y led.
* DoubleDabble : Genera 3 Valores en formato binario a partir de un número de 8 bits (los del duty). 
* DecoderBCD_7Seg : Recibe y muestra en display 7 segmentos los valores del duty.
* Pwm : Genera el pulso pwm.
* Modulo_Top :  Conecta todos los módulos en uno solo (top rtl).
* Pwm_TB : Desarrolla el testbench del módulo top.
* Top : Conecta los puertos del módulo top con los pines físicos del FPGA.

# ⚠️ ! ACERCA DEL TESTBENCH ! ⚠️
El testbench se elaboro sin el módulo presionar boton, dado que al incluirlo el tiempo de simulación es demasiado elevado por lo que no es viable el agregarlo, para esto solo es cuestion de omitir estas instanciaciones en el módulo top rtl.