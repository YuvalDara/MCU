onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /mcu_tb/MCU_Unit/MCLK_w
add wave -noupdate -radix hexadecimal /mcu_tb/MCU_Unit/MRST_w
add wave -noupdate -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/mclk_cnt_q
add wave -noupdate -radix hexadecimal /mcu_tb/MCU_Unit/data_bus_w
add wave -noupdate -radix hexadecimal /mcu_tb/MCU_Unit/addr_bus_w
add wave -noupdate -radix hexadecimal /mcu_tb/MCU_Unit/control_bus_w
add wave -noupdate -radix hexadecimal /mcu_tb/MCU_Unit/instruction_o
add wave -noupdate -radix hexadecimal /mcu_tb/MCU_Unit/pc_o
add wave -noupdate -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/dtcm_data_wr_i
add wave -noupdate -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/write_en_w
add wave -noupdate -radix hexadecimal /mcu_tb/MCU_Unit/GIE_w
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -group TB -radix hexadecimal /mcu_tb/rst_tb_w
add wave -noupdate -group TB -radix hexadecimal /mcu_tb/clk_tb_w
add wave -noupdate -group TB -radix hexadecimal /mcu_tb/switches_tb_w
add wave -noupdate -group TB -radix hexadecimal /mcu_tb/KEY1_w
add wave -noupdate -group TB -radix hexadecimal /mcu_tb/KEY2_w
add wave -noupdate -group TB -radix hexadecimal /mcu_tb/KEY3_w
add wave -noupdate -group TB -radix hexadecimal /mcu_tb/HEX0_w
add wave -noupdate -group TB -radix hexadecimal /mcu_tb/HEX1_w
add wave -noupdate -group TB -radix hexadecimal /mcu_tb/HEX2_w
add wave -noupdate -group TB -radix hexadecimal /mcu_tb/HEX3_w
add wave -noupdate -group TB -radix hexadecimal /mcu_tb/HEX4_w
add wave -noupdate -group TB -radix hexadecimal /mcu_tb/HEX5_w
add wave -noupdate -group TB -radix hexadecimal /mcu_tb/LEDR_w
add wave -noupdate -group TB -radix hexadecimal /mcu_tb/PWM_out_w
add wave -noupdate -group TB -radix hexadecimal /mcu_tb/control_bus_w
add wave -noupdate -group TB -radix hexadecimal /mcu_tb/addr_bus_w
add wave -noupdate -group TB -radix hexadecimal /mcu_tb/data_bus_w
add wave -noupdate -group TB -radix hexadecimal /mcu_tb/pc_w
add wave -noupdate -group TB -radix hexadecimal /mcu_tb/instruction_w
add wave -noupdate -group TB -radix hexadecimal /mcu_tb/memWriteTop_w
add wave -noupdate -group TB -radix hexadecimal /mcu_tb/memReadTop_w
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/clk_i
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/rst_i
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/switches_pher_input
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/KEY1_input
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/KEY2_input
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/KEY3_input
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/HEX0_pher_output
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/HEX1_pher_output
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/HEX2_pher_output
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/HEX3_pher_output
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/HEX4_pher_output
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/HEX5_pher_output
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/LEDR_pher_output
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/PWM_o
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/pc_o
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/ControlBus_o
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/AddrBus_o
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/DataBus_o
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/instruction_o
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/memWriteTop_o
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/memReadTop_o
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/Master_CLK_o
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/signal_CLK_o
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/test_pin_0_o
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/test_pin_1_o
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/test_pin_2_o
add wave -noupdate -group {MCU Top} -group IO -radix hexadecimal /mcu_tb/MCU_Unit/test_pin_3_o
add wave -noupdate -group {MCU Top} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MCLK_w
add wave -noupdate -group {MCU Top} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/SLOWCLK_w
add wave -noupdate -group {MCU Top} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MRST_w
add wave -noupdate -group {MCU Top} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/mem_write_ctrl_w
add wave -noupdate -group {MCU Top} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/mem_read_ctrl_w
add wave -noupdate -group {MCU Top} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/control_bus_w
add wave -noupdate -group {MCU Top} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/addr_bus_w
add wave -noupdate -group {MCU Top} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/data_bus_w
add wave -noupdate -group {MCU Top} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/BTIFG_w
add wave -noupdate -group {MCU Top} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/IntSrcVec_w
add wave -noupdate -group {MCU Top} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/INTR_w
add wave -noupdate -group {MCU Top} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/INTA_w
add wave -noupdate -group {MCU Top} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/GIE_w
add wave -noupdate -group {MCU Top} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/RXIFG_w
add wave -noupdate -group {MCU Top} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/TXIFG_w
add wave -noupdate -group {MCU Top} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/FIRIFG_w
add wave -noupdate -group {MCU Top} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/UART_status_error_w
add wave -noupdate -group {MCU Top} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/FIFOEMPTY_w
add wave -noupdate -group {MCU Top} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/half_cycle_size
add wave -noupdate -group {MCU Top} -group {FIR CLK Producer} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_CLK/rst
add wave -noupdate -group {MCU Top} -group {FIR CLK Producer} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_CLK/clk
add wave -noupdate -group {MCU Top} -group {FIR CLK Producer} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_CLK/enable
add wave -noupdate -group {MCU Top} -group {FIR CLK Producer} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_CLK/PWM_out
add wave -noupdate -group {MCU Top} -group {FIR CLK Producer} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_CLK/half_cycle_length
add wave -noupdate -group {MCU Top} -group {FIR CLK Producer} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_CLK/counter
add wave -noupdate -group {MCU Top} -group {FIR CLK Producer} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_CLK/PWM_w
add wave -noupdate -group {MIPS CPU} -group {Comp IO} -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/rst_i
add wave -noupdate -group {MIPS CPU} -group {Comp IO} -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/clk_i
add wave -noupdate -group {MIPS CPU} -group {Comp IO} -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/INTR_i
add wave -noupdate -group {MIPS CPU} -group {Comp IO} -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/pc_o
add wave -noupdate -group {MIPS CPU} -group {Comp IO} -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/instruction_o
add wave -noupdate -group {MIPS CPU} -group {Comp IO} -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/INTA_o
add wave -noupdate -group {MIPS CPU} -group {Comp IO} -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/GIE_o
add wave -noupdate -group {MIPS CPU} -group {Comp IO} -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MemWrite_ctrl_o
add wave -noupdate -group {MIPS CPU} -group {Comp IO} -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MemRead_ctrl_o
add wave -noupdate -group {MIPS CPU} -group {Comp IO} -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ControlBus_o
add wave -noupdate -group {MIPS CPU} -group {Comp IO} -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/AddrBus_o
add wave -noupdate -group {MIPS CPU} -group {Comp IO} -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/DataBus_io
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/pc_plus4_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/read_data1_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/read_data2_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/sign_extend_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/addr_res_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/alu_result_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/dtcm_data_rd_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/alu_src_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/branch_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/jump_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/reg_dst_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/reg_write_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/zero_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/mem_write_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MemtoReg_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/mem_read_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/alu_op_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/instruction_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MCLK_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/mclk_cnt_q
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/inst_cnt_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/next_pc_no_INT_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/pc_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/readData_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/rs_register_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/emulate_LOAD_and_JAL_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM_read_addr_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ISR_addr_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/turn_GIE_off_w
add wave -noupdate -group {MIPS CPU} -group Wires -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/data_not_for_DMEM_flag_w
add wave -noupdate -group {MIPS CPU} -group {Interrupt Service FSM} -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/Interrupt_Service_FSM/clk_i
add wave -noupdate -group {MIPS CPU} -group {Interrupt Service FSM} -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/Interrupt_Service_FSM/rst_i
add wave -noupdate -group {MIPS CPU} -group {Interrupt Service FSM} -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/Interrupt_Service_FSM/INTR_i
add wave -noupdate -group {MIPS CPU} -group {Interrupt Service FSM} -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/Interrupt_Service_FSM/Jump_ctrl_i
add wave -noupdate -group {MIPS CPU} -group {Interrupt Service FSM} -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/Interrupt_Service_FSM/rs_register_i
add wave -noupdate -group {MIPS CPU} -group {Interrupt Service FSM} -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/Interrupt_Service_FSM/INTA_o
add wave -noupdate -group {MIPS CPU} -group {Interrupt Service FSM} -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/Interrupt_Service_FSM/emulate_LOAD_and_JAL_o
add wave -noupdate -group {MIPS CPU} -group {Interrupt Service FSM} -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/Interrupt_Service_FSM/turn_GIE_off_o
add wave -noupdate -group {MIPS CPU} -group {Interrupt Service FSM} -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/Interrupt_Service_FSM/INT_state_w
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/clk_i
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/rst_i
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/add_result_i
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/Branch_ctrl_i
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/Jump_ctrl_i
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/alu_res_i
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/zero_i
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/jump_PC_to_ISR_i
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/ISR_addr_i
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/pc_o
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/pc_plus4_o
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/instruction_o
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_cnt_o
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/next_pc_no_INT_o
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/pc_q
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/pc_plus4_r
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/itcm_addr_w
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/next_pc_mux1_w
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/next_pc_mux2_w
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/next_pc_with_interrupts_w
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/rst_flag_q
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_cnt_q
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/pc_prev_q
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/instruction_w
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/address_shifted2_w
add wave -noupdate -group {MIPS CPU} -group IFETCH -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/zeros_helper
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/wren_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/wren_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/rden_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/rden_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/data_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/data_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/address_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/address_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/clock0
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/clock1
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/clocken0
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/clocken1
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/clocken2
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/clocken3
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/aclr0
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/aclr1
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/addressstall_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/addressstall_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/byteena_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/byteena_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/q_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/q_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/eccstatus
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_data_reg_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_data_reg_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_q_reg_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_q_tmp_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_q_tmp2_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_q_tmp_wren_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_q_tmp2_wren_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_q_tmp_wren_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_q_reg_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_q_tmp_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_q_tmp2_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_q_output_latch
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_q_ecc_reg_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_q_ecc_tmp_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_current_written_data_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_original_data_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_original_data_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_byteena_mask_reg_a_x
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_byteena_mask_reg_b_x
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_byteena_mask_reg_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_byteena_mask_reg_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_byteena_mask_reg_a_out
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_byteena_mask_reg_b_out
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_byteena_mask_reg_a_out_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_byteena_mask_reg_b_out_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_address_reg_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_address_reg_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_wren_reg_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_wren_reg_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_rden_reg_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_rden_reg_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_read_flag_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_read_flag_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_reread_flag_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_reread_flag_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_reread_flag2_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_reread_flag2_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_write_flag_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_write_flag_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_nmram_write_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_nmram_write_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_indata_aclr_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_address_aclr_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_wrcontrol_aclr_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_indata_aclr_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_address_aclr_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_wrcontrol_aclr_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_outdata_aclr_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_outdata_aclr_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_rdcontrol_aclr_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_byteena_aclr_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_byteena_aclr_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/good_to_go_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/good_to_go_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_core_clocken_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_core_clocken_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_core_clocken_b0
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_core_clocken_b1
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_inclocken0
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_input_clocken_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_outdata_clken_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_outdata_clken_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_outlatch_clken_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_outlatch_clken_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_core_clocken_a_reg
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_core_clocken_b_reg
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/default_val
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_data_zero_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_data_zero_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_data_ones_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_data_ones_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/same_clock_pulse0
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/same_clock_pulse1
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_force_reread_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_force_reread_a1
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_force_reread_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_force_reread_b1
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_force_reread_signal_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_force_reread_signal_b
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_good_to_write_a
add wave -noupdate -group {MIPS CPU} -group IFETCH -group ITCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/IFE/inst_memory/i_good_to_write_b
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/clk_i
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/rst_i
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/instruction_i
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/dtcm_data_rd_i
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/alu_result_i
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/RegWrite_ctrl_i
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/MemtoReg_ctrl_i
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/RegDst_ctrl_i
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/pc_plus_4_i
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/next_pc_no_INT_i
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/emulate_LOAD_and_JAL_i
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/turn_GIE_off_i
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/read_data1_o
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/read_data2_o
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/sign_extend_o
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/rs_register_o
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/GIE_o
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/RF_q
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/write_reg_addr_w
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/write_reg_data_mid_w
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/write_reg_data_final_w
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/rs_register_w
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/rt_register_w
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/rd_register_w
add wave -noupdate -group {MIPS CPU} -group IDECODE -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/ID/imm_value_w
add wave -noupdate -group {MIPS CPU} -group Control -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/CTL/opcode_i
add wave -noupdate -group {MIPS CPU} -group Control -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/CTL/funct_i
add wave -noupdate -group {MIPS CPU} -group Control -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/CTL/RegDst_ctrl_o
add wave -noupdate -group {MIPS CPU} -group Control -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/CTL/Jump_ctrl_o
add wave -noupdate -group {MIPS CPU} -group Control -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/CTL/ALUSrc_ctrl_o
add wave -noupdate -group {MIPS CPU} -group Control -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/CTL/MemtoReg_ctrl_o
add wave -noupdate -group {MIPS CPU} -group Control -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/CTL/RegWrite_ctrl_o
add wave -noupdate -group {MIPS CPU} -group Control -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/CTL/MemRead_ctrl_o
add wave -noupdate -group {MIPS CPU} -group Control -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/CTL/MemWrite_ctrl_o
add wave -noupdate -group {MIPS CPU} -group Control -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/CTL/Branch_ctrl_o
add wave -noupdate -group {MIPS CPU} -group Control -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/CTL/ALUOp_ctrl_o
add wave -noupdate -group {MIPS CPU} -group Control -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/CTL/rtype_w
add wave -noupdate -group {MIPS CPU} -group Control -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/CTL/lw_w
add wave -noupdate -group {MIPS CPU} -group Control -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/CTL/sw_w
add wave -noupdate -group {MIPS CPU} -group Control -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/CTL/beq_w
add wave -noupdate -group {MIPS CPU} -group Control -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/CTL/itype_imm_w
add wave -noupdate -group {MIPS CPU} -group Control -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/CTL/jal_w
add wave -noupdate -group {MIPS CPU} -group Control -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/CTL/jr_w
add wave -noupdate -group {MIPS CPU} -group Control -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/CTL/mul_w
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/read_data1_i
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/read_data2_i
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/sign_extend_i
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/funct_i
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/shamt_i
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/ALUOp_ctrl_i
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/ALUSrc_ctrl_i
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/pc_plus4_i
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/zero_o
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/alu_res_o
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/addr_res_o
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/a_input_w
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/b_input_w
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/alu_out_mux_w
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/shift_res_w
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/branch_addr_r
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/alu_ctl_w
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/shift_dir_w
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/shift_flag_w
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/Shifter_L/y
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/Shifter_L/x
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/Shifter_L/shift_dir
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/Shifter_L/outp
add wave -noupdate -group {MIPS CPU} -group Execute -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/EXE/Shifter_L/row
add wave -noupdate -group {MIPS CPU} -group DMEMORY -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/clk_i
add wave -noupdate -group {MIPS CPU} -group DMEMORY -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/rst_i
add wave -noupdate -group {MIPS CPU} -group DMEMORY -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/dtcm_addr_i
add wave -noupdate -group {MIPS CPU} -group DMEMORY -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/dtcm_w_en_i
add wave -noupdate -group {MIPS CPU} -group DMEMORY -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/dtcm_data_wr_i
add wave -noupdate -group {MIPS CPU} -group DMEMORY -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/MemRead_ctrl_i
add wave -noupdate -group {MIPS CPU} -group DMEMORY -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/MemWrite_ctrl_i
add wave -noupdate -group {MIPS CPU} -group DMEMORY -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/dtcm_data_rd_o
add wave -noupdate -group {MIPS CPU} -group DMEMORY -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/wrclk_w
add wave -noupdate -group {MIPS CPU} -group DMEMORY -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/write_en_w
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/wren_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/wren_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/rden_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/rden_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/data_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/data_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/address_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/address_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/clock0
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/clock1
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/clocken0
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/clocken1
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/clocken2
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/clocken3
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/aclr0
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/aclr1
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/addressstall_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/addressstall_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/byteena_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/byteena_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/q_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/q_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/eccstatus
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_data_reg_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_data_reg_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_q_reg_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_q_tmp_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_q_tmp2_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_q_tmp_wren_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_q_tmp2_wren_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_q_tmp_wren_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_q_reg_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_q_tmp_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_q_tmp2_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_q_output_latch
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_q_ecc_reg_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_q_ecc_tmp_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_current_written_data_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_original_data_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_original_data_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_byteena_mask_reg_a_x
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_byteena_mask_reg_b_x
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_byteena_mask_reg_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_byteena_mask_reg_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_byteena_mask_reg_a_out
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_byteena_mask_reg_b_out
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_byteena_mask_reg_a_out_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_byteena_mask_reg_b_out_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_address_reg_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_address_reg_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_wren_reg_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_wren_reg_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_rden_reg_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_rden_reg_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_read_flag_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_read_flag_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_reread_flag_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_reread_flag_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_reread_flag2_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_reread_flag2_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_write_flag_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_write_flag_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_nmram_write_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_nmram_write_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_indata_aclr_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_address_aclr_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_wrcontrol_aclr_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_indata_aclr_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_address_aclr_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_wrcontrol_aclr_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_outdata_aclr_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_outdata_aclr_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_rdcontrol_aclr_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_byteena_aclr_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_byteena_aclr_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/good_to_go_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/good_to_go_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_core_clocken_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_core_clocken_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_core_clocken_b0
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_core_clocken_b1
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_inclocken0
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_input_clocken_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_outdata_clken_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_outdata_clken_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_outlatch_clken_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_outlatch_clken_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_core_clocken_a_reg
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_core_clocken_b_reg
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/default_val
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_data_zero_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_data_zero_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_data_ones_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_data_ones_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/same_clock_pulse0
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/same_clock_pulse1
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_force_reread_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_force_reread_a1
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_force_reread_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_force_reread_b1
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_force_reread_signal_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_force_reread_signal_b
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_good_to_write_a
add wave -noupdate -group {MIPS CPU} -group DMEMORY -group DTCM -radix hexadecimal /mcu_tb/MCU_Unit/MIPS_CORE/MEM/data_memory/i_good_to_write_b
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/clk_i
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/rst_i
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/addr_bus_i
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/mem_read_ctrl_i
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/mem_write_ctrl_i
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/switches_pher_input
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/data_bus_io
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX0_pher_output
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX1_pher_output
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX2_pher_output
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX3_pher_output
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX4_pher_output
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX5_pher_output
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/LEDR_pher_output
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/CS_HEX0_w
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/CS_HEX1_w
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/CS_HEX2_w
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/CS_HEX3_w
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/CS_HEX4_w
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/CS_HEX5_w
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/CS_LEDR_w
add wave -noupdate -group {GPIO Peripherals} -group {Comp IO And Wires} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/CS_switches_w
add wave -noupdate -group {GPIO Peripherals} -group Decoder -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/Decoder/rst_i
add wave -noupdate -group {GPIO Peripherals} -group Decoder -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/Decoder/addr_bus_i
add wave -noupdate -group {GPIO Peripherals} -group Decoder -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/Decoder/CS_HEX0_o
add wave -noupdate -group {GPIO Peripherals} -group Decoder -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/Decoder/CS_HEX1_o
add wave -noupdate -group {GPIO Peripherals} -group Decoder -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/Decoder/CS_HEX2_o
add wave -noupdate -group {GPIO Peripherals} -group Decoder -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/Decoder/CS_HEX3_o
add wave -noupdate -group {GPIO Peripherals} -group Decoder -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/Decoder/CS_HEX4_o
add wave -noupdate -group {GPIO Peripherals} -group Decoder -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/Decoder/CS_HEX5_o
add wave -noupdate -group {GPIO Peripherals} -group Decoder -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/Decoder/CS_LEDR_o
add wave -noupdate -group {GPIO Peripherals} -group Decoder -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/Decoder/CS_Switches_o
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX0/clk_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX0/rst_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX0/mem_read_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX0/mem_write_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX0/chip_select_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX0/data_bus_io
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX0/peripheral_output_o
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX0/q
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX0/SevenSegDec/data
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX0/SevenSegDec/seg
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX0/SevenSegDec/data_mid
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX0/SevenSegDec/seg_mid
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX1/clk_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX1/rst_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX1/mem_read_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX1/mem_write_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX1/chip_select_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX1/data_bus_io
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX1/peripheral_output_o
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX1/q
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX1/SevenSegDec/data
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX1/SevenSegDec/seg
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX1/SevenSegDec/data_mid
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX1/SevenSegDec/seg_mid
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX2/clk_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX2/rst_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX2/mem_read_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX2/mem_write_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX2/chip_select_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX2/data_bus_io
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX2/peripheral_output_o
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX2/q
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX2/SevenSegDec/data
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX2/SevenSegDec/seg
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX2/SevenSegDec/data_mid
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX2/SevenSegDec/seg_mid
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX3/clk_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX3/rst_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX3/mem_read_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX3/mem_write_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX3/chip_select_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX3/data_bus_io
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX3/peripheral_output_o
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX3/q
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX3/SevenSegDec/data
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX3/SevenSegDec/seg
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX3/SevenSegDec/data_mid
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX3/SevenSegDec/seg_mid
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX4/clk_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX4/rst_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX4/mem_read_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX4/mem_write_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX4/chip_select_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX4/data_bus_io
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX4/peripheral_output_o
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX4/q
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX4/SevenSegDec/data
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX4/SevenSegDec/seg
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX4/SevenSegDec/data_mid
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX4/SevenSegDec/seg_mid
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX5/clk_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX5/rst_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX5/mem_read_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX5/mem_write_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX5/chip_select_i
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX5/data_bus_io
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX5/peripheral_output_o
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX5/q
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX5/SevenSegDec/data
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX5/SevenSegDec/seg
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX5/SevenSegDec/data_mid
add wave -noupdate -group {GPIO Peripherals} -group {HEX Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/HEX5/SevenSegDec/seg_mid
add wave -noupdate -group {GPIO Peripherals} -group {LEDR Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/LEDR/clk_i
add wave -noupdate -group {GPIO Peripherals} -group {LEDR Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/LEDR/rst_i
add wave -noupdate -group {GPIO Peripherals} -group {LEDR Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/LEDR/mem_read_i
add wave -noupdate -group {GPIO Peripherals} -group {LEDR Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/LEDR/mem_write_i
add wave -noupdate -group {GPIO Peripherals} -group {LEDR Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/LEDR/chip_select_i
add wave -noupdate -group {GPIO Peripherals} -group {LEDR Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/LEDR/data_bus_io
add wave -noupdate -group {GPIO Peripherals} -group {LEDR Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/LEDR/peripheral_output_o
add wave -noupdate -group {GPIO Peripherals} -group {LEDR Output} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/LEDR/q
add wave -noupdate -group {GPIO Peripherals} -group {Switches Input} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/Switches/mem_read_i
add wave -noupdate -group {GPIO Peripherals} -group {Switches Input} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/Switches/chip_select_i
add wave -noupdate -group {GPIO Peripherals} -group {Switches Input} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/Switches/peripheral_input_i
add wave -noupdate -group {GPIO Peripherals} -group {Switches Input} -radix hexadecimal /mcu_tb/MCU_Unit/GPIO_Peripherals/Switches/data_bus_io
add wave -noupdate -group BasicTimer -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/clk_i
add wave -noupdate -group BasicTimer -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/rst_i
add wave -noupdate -group BasicTimer -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/addr_bus_i
add wave -noupdate -group BasicTimer -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/mem_read_ctrl_i
add wave -noupdate -group BasicTimer -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/mem_write_ctrl_i
add wave -noupdate -group BasicTimer -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/control_bus_i
add wave -noupdate -group BasicTimer -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/data_bus_io
add wave -noupdate -group BasicTimer -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BTIFG_o
add wave -noupdate -group BasicTimer -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/PWM_o
add wave -noupdate -group BasicTimer -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BTCTL_w
add wave -noupdate -group BasicTimer -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BTCCR0_w
add wave -noupdate -group BasicTimer -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BTCCR1_w
add wave -noupdate -group BasicTimer -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BTCNT_write_flag_w
add wave -noupdate -group BasicTimer -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BTCNT_write_value_w
add wave -noupdate -group BasicTimer -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BTCNT_read_w
add wave -noupdate -group BasicTimer -group {Basic Timer} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/mclk
add wave -noupdate -group BasicTimer -group {Basic Timer} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/BTCLR
add wave -noupdate -group BasicTimer -group {Basic Timer} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/BTHOLD
add wave -noupdate -group BasicTimer -group {Basic Timer} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/BTOUTMD
add wave -noupdate -group BasicTimer -group {Basic Timer} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/BTOUTEN
add wave -noupdate -group BasicTimer -group {Basic Timer} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/BTSSEL
add wave -noupdate -group BasicTimer -group {Basic Timer} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/BTCCR1
add wave -noupdate -group BasicTimer -group {Basic Timer} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/BTCCR0
add wave -noupdate -group BasicTimer -group {Basic Timer} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/BTIP
add wave -noupdate -group BasicTimer -group {Basic Timer} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/BTCNT_write_flag_i
add wave -noupdate -group BasicTimer -group {Basic Timer} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/BTCNT_write_value_i
add wave -noupdate -group BasicTimer -group {Basic Timer} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/BTCNT_read_o
add wave -noupdate -group BasicTimer -group {Basic Timer} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/BTIFG
add wave -noupdate -group BasicTimer -group {Basic Timer} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/PWMout
add wave -noupdate -group BasicTimer -group {Basic Timer} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/counter_enable
add wave -noupdate -group BasicTimer -group {Basic Timer} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/BTCL0
add wave -noupdate -group BasicTimer -group {Basic Timer} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/BTCL1
add wave -noupdate -group BasicTimer -group {Basic Timer} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/HEU0
add wave -noupdate -group BasicTimer -group {Basic Timer} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/counterOut
add wave -noupdate -group BasicTimer -group {Basic Timer} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/out_buffer
add wave -noupdate -group BasicTimer -group {Basic Timer} -group {Counter Input Clock} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/divided_clk
add wave -noupdate -group BasicTimer -group {Basic Timer} -group {Counter Input Clock} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/counter_clk
add wave -noupdate -group BasicTimer -group {Basic Timer} -group {Counter Input Clock} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/freq_div
add wave -noupdate -group BasicTimer -group {Basic Timer} -group {Counter Input Clock} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/div_counter
add wave -noupdate -group BasicTimer -group {Basic Timer} -group {Inner Counter} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/counter_map/rst
add wave -noupdate -group BasicTimer -group {Basic Timer} -group {Inner Counter} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/counter_map/clk
add wave -noupdate -group BasicTimer -group {Basic Timer} -group {Inner Counter} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/counter_map/enable
add wave -noupdate -group BasicTimer -group {Basic Timer} -group {Inner Counter} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/counter_map/hit_upper_limit
add wave -noupdate -group BasicTimer -group {Basic Timer} -group {Inner Counter} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/counter_map/set_starting_cnt
add wave -noupdate -group BasicTimer -group {Basic Timer} -group {Inner Counter} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/counter_map/starting_cnt
add wave -noupdate -group BasicTimer -group {Basic Timer} -group {Inner Counter} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/counter_map/q
add wave -noupdate -group BasicTimer -group {Basic Timer} -group {Inner Counter} -radix hexadecimal /mcu_tb/MCU_Unit/BT_Peripheral/BasicTimer/counter_map/q_int
add wave -noupdate -group {FIR Filter} -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/clk_i
add wave -noupdate -group {FIR Filter} -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/rst_i
add wave -noupdate -group {FIR Filter} -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIRCLK_i
add wave -noupdate -group {FIR Filter} -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/addr_bus_i
add wave -noupdate -group {FIR Filter} -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/mem_read_ctrl_i
add wave -noupdate -group {FIR Filter} -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/mem_write_ctrl_i
add wave -noupdate -group {FIR Filter} -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/control_bus_i
add wave -noupdate -group {FIR Filter} -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/data_bus_io
add wave -noupdate -group {FIR Filter} -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIFOEMPTY_o
add wave -noupdate -group {FIR Filter} -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIRIFG_o
add wave -noupdate -group {FIR Filter} -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIRCTL_w
add wave -noupdate -group {FIR Filter} -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIRIN_w
add wave -noupdate -group {FIR Filter} -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIROUT_w
add wave -noupdate -group {FIR Filter} -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/COEF3_0_w
add wave -noupdate -group {FIR Filter} -group {CPU Communication Wrapper} -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/COEF7_4_w
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/FIRIN
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/FIFORST
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/FIFOCLK
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/FIFOWEN
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/FIFOFULL
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/FIFOEMPTY
add wave -noupdate -group {FIR Filter} -group Filter -group Coefficients -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/COEF0
add wave -noupdate -group {FIR Filter} -group Filter -group Coefficients -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/COEF1
add wave -noupdate -group {FIR Filter} -group Filter -group Coefficients -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/COEF2
add wave -noupdate -group {FIR Filter} -group Filter -group Coefficients -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/COEF3
add wave -noupdate -group {FIR Filter} -group Filter -group Coefficients -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/COEF4
add wave -noupdate -group {FIR Filter} -group Filter -group Coefficients -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/COEF5
add wave -noupdate -group {FIR Filter} -group Filter -group Coefficients -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/COEF6
add wave -noupdate -group {FIR Filter} -group Filter -group Coefficients -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/COEF7
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/FIRCLK
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/FIRRST
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/FIRENA
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/FIRIFG
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/FIROUT
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/FIFO_queue
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/r_ptr
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/w_ptr
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/QUEUE_full
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/QUEUE_empty
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/FIFOREN
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/firclk_s1
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/firclk_s2
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/firclk_s2_d
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/single_FIFOCLK_pulse_per_FIRCLK_cycle
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/X_array
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/P
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/sum
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/C
add wave -noupdate -group {FIR Filter} -group Filter -radix hexadecimal /mcu_tb/MCU_Unit/FIR_peripheral/FIR_Filter/FIROUT_w
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/clk_i
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/rst_i
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/mem_read_ctrl_i
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/mem_write_ctrl_i
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/int_src_vec_i
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/INTA_i
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/addr_bus_i
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/GIE_i
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/UART_status_error_i
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/FIFOEMPTY_i
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/FIRIFG_flag_for_FIROUT_i
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/data_bus_io
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/INTR_o
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/IE_w
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/IFG_w
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/INTA_inverse_w
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/INTA_inverse_delayed_w
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/type_reg_data_w
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/type_reg_data_delayed_w
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/IRQ_w
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/CLR_INT_w
add wave -noupdate -group {Interrupt Controller} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/temp_signal
add wave -noupdate -group {Interrupt Controller} -group {Source Rising Edge Detectors} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/GEN_IRQ_HANDLERS(0)/src_d1
add wave -noupdate -group {Interrupt Controller} -group {Source Rising Edge Detectors} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/GEN_IRQ_HANDLERS(0)/src_d2
add wave -noupdate -group {Interrupt Controller} -group {Source Rising Edge Detectors} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/GEN_IRQ_HANDLERS(1)/src_d1
add wave -noupdate -group {Interrupt Controller} -group {Source Rising Edge Detectors} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/GEN_IRQ_HANDLERS(1)/src_d2
add wave -noupdate -group {Interrupt Controller} -group {Source Rising Edge Detectors} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/GEN_IRQ_HANDLERS(2)/src_d1
add wave -noupdate -group {Interrupt Controller} -group {Source Rising Edge Detectors} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/GEN_IRQ_HANDLERS(2)/src_d2
add wave -noupdate -group {Interrupt Controller} -group {Source Rising Edge Detectors} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/GEN_IRQ_HANDLERS(3)/src_d1
add wave -noupdate -group {Interrupt Controller} -group {Source Rising Edge Detectors} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/GEN_IRQ_HANDLERS(3)/src_d2
add wave -noupdate -group {Interrupt Controller} -group {Source Rising Edge Detectors} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/GEN_IRQ_HANDLERS(4)/src_d1
add wave -noupdate -group {Interrupt Controller} -group {Source Rising Edge Detectors} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/GEN_IRQ_HANDLERS(4)/src_d2
add wave -noupdate -group {Interrupt Controller} -group {Source Rising Edge Detectors} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/GEN_IRQ_HANDLERS(5)/src_d1
add wave -noupdate -group {Interrupt Controller} -group {Source Rising Edge Detectors} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/GEN_IRQ_HANDLERS(5)/src_d2
add wave -noupdate -group {Interrupt Controller} -group {Source Rising Edge Detectors} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/GEN_IRQ_HANDLERS(6)/src_d1
add wave -noupdate -group {Interrupt Controller} -group {Source Rising Edge Detectors} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/GEN_IRQ_HANDLERS(6)/src_d2
add wave -noupdate -group {Interrupt Controller} -group {Source Rising Edge Detectors} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/GEN_IRQ_HANDLERS(7)/src_d1
add wave -noupdate -group {Interrupt Controller} -group {Source Rising Edge Detectors} -radix hexadecimal /mcu_tb/MCU_Unit/Interrupt_Controller/GEN_IRQ_HANDLERS(7)/src_d2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {224545468 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 211
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {359607442 ps} {360830985 ps}
