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
set_global_assignment -name VHDL_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VHDL/Calculadora4Bits/rtl/Medio_Sumador.vhd"
set_global_assignment -name VHDL_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VHDL/Calculadora4Bits/rtl/Sumador_Completo.vhd"
set_global_assignment -name VHDL_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VHDL/Calculadora4Bits/rtl/Medio_Restador.vhd"
set_global_assignment -name VHDL_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VHDL/Calculadora4Bits/rtl/Restador_Completo.vhd"
set_global_assignment -name VHDL_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VHDL/Calculadora4Bits/rtl/Sumador4_Bits.vhd"
set_global_assignment -name VHDL_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VHDL/Calculadora4Bits/rtl/Restador4_Bits.vhd"
set_global_assignment -name VHDL_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VHDL/Calculadora4Bits/rtl/Multiplicador4_Bits.vhd"
set_global_assignment -name VHDL_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VHDL/Calculadora4Bits/rtl/DoubleDabble.vhd"
set_global_assignment -name VHDL_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VHDL/Calculadora4Bits/rtl/DecoderBCD_7Seg.vhd"
set_global_assignment -name VHDL_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VHDL/Calculadora4Bits/rtl/DecodificadorBinario_Hexadecimal.vhd"
set_global_assignment -name VHDL_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VHDL/Calculadora4Bits/rtl/Calculadora4Bits.vhd"
set_global_assignment -name VHDL_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VHDL/Calculadora4Bits/rtl/Top.vhd"

#quartus_pgm -m jtag -o "p;de10lite_demo.sof"
#ASIGNAMIENTO DE PINES
source pins.tcl

#COMPILADO
execute_flow -compile
