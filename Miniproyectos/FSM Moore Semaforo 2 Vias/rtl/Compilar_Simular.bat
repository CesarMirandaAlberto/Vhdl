@echo off

echo =============COMPILACION===================
echo Compilando mi diseno......

ghdl -a --std=08 Divisor_Frecuencia.vhd
ghdl -a --std=08 Contador.vhd
ghdl -a --std=08 FSM_Semaforo2V.vhd
ghdl -a --std=08 Modulo_Top.vhd
ghdl -a --std=08 FSM_Semaforo2V_TB.vhd

echo ==============TESTBENCH=====================
echo Desarrollando testbench......
ghdl -e --std=08 FSM_Semaforo2V_TB

echo =================VCD========================
echo Generando archivos VCD.......
ghdl -r  --std=08 FSM_Semaforo2V_TB --vcd=Simulacion.vcd

echo =============PROCESO TERMINADO===============
echo Abriendo visualizador  de ondas......

gtkwave Simulacion.vcd
pause
