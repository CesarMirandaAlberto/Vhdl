:: PLANTILLA GENERICA CON FINES EDUCATIVOS Y DE PRÁCTICA
@echo off
echo ============================================================
echo				COMPILANDO DISENO
echo ============================================================

quartus_sh -t build.tcl

echo ============================================================
echo 				BAJANDO AL FPGA
echo ============================================================

quartus_pgm -m jtag -o "p;de10lite_demo.sof"

echo ============================================================
echo 				DISENO BAJADO CON ÉXITO
echo ============================================================

pause
