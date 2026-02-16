#ASIGNACIÓN DE PINES 	
# **** ENTRADAS ****
	
#Reset y reloj
set_location_assignment PIN_P11 -to CLK_50MHZ
set_location_assignment PIN_C10 -to BTN_RST

#BOTONES AUMENTAR Y DISMINUIR SEÑAL PWM
set_location_assignment PIN_B8 -to BTN_AUMENTAR
set_location_assignment PIN_A7 -to BTN_DISMINUIR

#LED CON SEÑAL PWM
set_location_assignment PIN_A8 -to SALIDA

#DISPLAY SIETE SEGMENTOS
#UNIDADES
set_location_assignment PIN_C14 -to DISPLAY_UNIDADES[0]
set_location_assignment PIN_E15 -to DISPLAY_UNIDADES[1]
set_location_assignment PIN_C15 -to DISPLAY_UNIDADES[2]
set_location_assignment PIN_C16 -to DISPLAY_UNIDADES[3]
set_location_assignment PIN_E16 -to DISPLAY_UNIDADES[4]
set_location_assignment PIN_D17 -to DISPLAY_UNIDADES[5]
set_location_assignment PIN_C17 -to DISPLAY_UNIDADES[6]

#DECENAS
set_location_assignment PIN_C18 -to DISPLAY_DECENAS[0]
set_location_assignment PIN_D18 -to DISPLAY_DECENAS[1]
set_location_assignment PIN_E18 -to DISPLAY_DECENAS[2]
set_location_assignment PIN_B16 -to DISPLAY_DECENAS[3]
set_location_assignment PIN_A17 -to DISPLAY_DECENAS[4]
set_location_assignment PIN_A18 -to DISPLAY_DECENAS[5]
set_location_assignment PIN_B17 -to DISPLAY_DECENAS[6]

#CENTENAS
set_location_assignment PIN_B20 -to DISPLAY_CENTENAS[0]
set_location_assignment PIN_A20 -to DISPLAY_CENTENAS[1]
set_location_assignment PIN_B19 -to DISPLAY_CENTENAS[2]
set_location_assignment PIN_A21 -to DISPLAY_CENTENAS[3]
set_location_assignment PIN_B21 -to DISPLAY_CENTENAS[4]
set_location_assignment PIN_C22 -to DISPLAY_CENTENAS[5]
set_location_assignment PIN_B22 -to DISPLAY_CENTENAS[6]