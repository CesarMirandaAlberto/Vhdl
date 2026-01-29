#crear plantilla
project_new de10lite_demo -overwrite

#ABRIR DEMO
project_open de10lite_demo

#Paquete de flujo
load_package flow

#DATOS DE FPGA
set_global_assignment -name FAMILY "MAX 10"
set_global_assignment -name DEVICE 10M50DAF484C7G
set_global_assignment -name TOP_LEVEL_ENTITY Top

#CONFIGURACION DE ARCHIVOS 
set_global_assignment -name VHDL_FILE "./Divisor_Frecuencia.vhd"
set_global_assignment -name VHDL_FILE "./Contador.vhd"
set_global_assignment -name VHDL_FILE "./FSM_Semaforo2V.vhd"
set_global_assignment -name VHDL_FILE "./Modulo_Top.vhd"
set_global_assignment -name VHDL_FILE "./Top.vhd"

#quartus_pgm -m jtag -o "p;de10lite_demo.sof"
#ASIGNAMIENTO DE PINES
source pins.tcl

#COMPILADO
execute_flow -compile
