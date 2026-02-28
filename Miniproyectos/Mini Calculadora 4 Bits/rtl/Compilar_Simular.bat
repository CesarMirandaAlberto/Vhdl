:: PLANTILLA GENERICA CON FINES DE PRÁCTICA Y EDUCATIVOS
@echo off

echo =============COMPILACION===================
echo Compilando mi diseno......

ghdl -a --std=08 Medio_Sumador.vhd
ghdl -a --std=08 Sumador_Completo.vhd
ghdl -a --std=08 Medio_Restador.vhd
ghdl -a --std=08 Restador_Completo.vhd
ghdl -a --std=08 Sumador4_Bits.vhd
ghdl -a --std=08 Restador4_Bits.vhd
ghdl -a --std=08 Multiplicador4_Bits.vhd
ghdl -a --std=08 DoubleDabble.vhd
ghdl -a --std=08 DecoderBCD_7Seg.vhd
ghdl -a --std=08 DecodificadorBinario_Hexadecimal.vhd
ghdl -a --std=08 Calculadora4Bits.vhd
ghdl -a --std=08 Calculadora4Bits_TB.vhd

echo ==============TESTBENCH=====================
echo Desarrollando testbench......
ghdl -e --std=08 Calculadora4Bits_TB

echo =================VCD========================
echo Generando archivos VCD.......
ghdl -r  --std=08 Calculadora4Bits_TB --vcd=Simulacion.vcd

echo =============PROCESO TERMINADO===============
echo Abriendo visualizador  de ondas......

gtkwave Simulacion.vcd
pause
