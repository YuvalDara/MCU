==================================================================================
					Description of the source code test1.asm:
==================================================================================
Input:  KEY3, KEY2, KEY1
Output: PORT_HEX0[7-0],PORT_HEX1[7-0],PORT_HEX2[7-0],PORT_HEX3[7-0],
		PORT_HEX4[7-0],PORT_HEX5[7-0],PORT_LEDR[7-0]
RESET:  Pushbutton KEY0
----------------------------------------------------------------------------------
on RESET:
---------
configuration of all peripheral modules and FSM kernel set to STATE0
fpwm=MCLK/(8*3125) with duty-cycle=50%, fintBT=MCLK/(8*3125)
Loading FIR coefficients, Filling up the FIR FIFO, FIR start operation
USART start operation.

On KEY1 pushing:
---------------
STATE0 is selected, set $t8 and $t9 global accumulated and step values for timer ISR counting

On KEY2 pushing:
---------------
STATE1 is selected, set $t8 and $t9 global accumulated and step values for timer ISR counting

On KEY3 pushing:
---------------
STATE2 is selected, set $t8 and $t9 global accumulated and step values for timer ISR counting

On FIR new result (data interrupt):
----------------------------------   
Write a result to FIR output array and fillup the FIFO if needed.

On RX interrupt:
---------------
Print the RX buffer to the PORT_LEDR

On TX interrupt:
---------------
Send the PORT_SW to the TX buffer




									
