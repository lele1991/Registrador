# ============================================================================
# Name        : tb.do
# Author      : Let�cia de Oliveira Nunes
# Version     : 0.1
# Copyright   : Renan, Departamento de Eletr�nica, Florian�polis, IFSC
# Description : Registrador
# ============================================================================

#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem � importante
vcom reg.vhd 
vcom testbench.vhd

#Simula (work � o diretorio, testbench � o nome da entity)
vsim -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas espec�ficas
# -radix: binary, hex, dec
# -label: nome da forma de onda
#sinais do testbench
add wave -radix bin -label clock  /clkT
add wave -radix bin -label sclr /sclr_nT
add wave -radix bin -label enable /clk_enaT
add wave -radix bin -label datain /datainT
add wave -radix bin -label output /reg_outT


#Como mostrar sinais internos do processo

#Simula at� um 100ns
run 100ns

wave zoomfull
#write wave wave.ps