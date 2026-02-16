:: PLANTILLA GENERICA CON FINES EDUCATIVOS Y DE PRÁCTICA
@echo off
echo ====== COMPILANDO =====
quartus_sh -t build.tcl



echo ====== BAJANDO AL FPGA ========
quartus_pgm -m jtag -o "p;de10lite_demo.sof"


echo ====== CODIGO BAJADO CON EXITO ========

pause
