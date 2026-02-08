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
set_global_assignment -name VHDL_FILE "C:/Users/cesar/Desktop/Proyectos/TCLFPGA/VHDL/FSMMELAY/rtl/Divisor_Frecuencia.vhd"
set_global_assignment -name VHDL_FILE "C:/Users/cesar/Desktop/Proyectos/TCLFPGA/VHDL/FSMMELAY/rtl/DecoderBCD_7Seg.vhd"
set_global_assignment -name VHDL_FILE "C:/Users/cesar/Desktop/Proyectos/TCLFPGA/VHDL/FSMMELAY/rtl/DoubleDabble.vhd"
set_global_assignment -name VHDL_FILE "C:/Users/cesar/Desktop/Proyectos/TCLFPGA/VHDL/FSMMELAY/rtl/PresionarBoton.vhd"
set_global_assignment -name VHDL_FILE "C:/Users/cesar/Desktop/Proyectos/TCLFPGA/VHDL/FSMMELAY/rtl/FSM_Expendedora.vhd"
set_global_assignment -name VHDL_FILE "C:/Users/cesar/Desktop/Proyectos/TCLFPGA/VHDL/FSMMELAY/rtl/Modulo_Top.vhd"
set_global_assignment -name VHDL_FILE "C:/Users/cesar/Desktop/Proyectos/TCLFPGA/VHDL/FSMMELAY/rtl/Top.vhd"
#quartus_pgm -m jtag -o "p;de10lite_demo.sof"
#ASIGNAMIENTO DE PINES
source pins.tcl

#COMPILADO
execute_flow -compile
