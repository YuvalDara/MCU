----------------------------------------------------------------------------------
				Description of the source code test1.asm:
----------------------------------------------------------------------------------
Input:  PORT_SW[7-0] 
Output: PORT_LEDG[7-0], PORT_LEDR[7-0], PORT_HEX0, PORT_HEX1, PORT_HEX2, PORT_HEX3
RESET:  Pushbutton KEY0

The program execution:
1) if SW0 is set(other SW1-SW7 don't matter):
		counting up by 2, shown separately onto all output devices
   elsif SW1 is set(other SW0,SW2-SW7 don't matter):
		counting down by 2, shown separately onto all output devices
   else
		do nothing (output state preserved)
2) On RESET: clear all outputs
----------------------------------------------------------------------------------

