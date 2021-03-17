# ============================================================================
# Name        : tb.do
# Author      : Letícia de Oliveira Nunes
# Version     : 0.1
# Copyright   : Renan, Departamento de Eletrônica, Florianópolis, IFSC
# Description : Registrador
# ============================================================================

#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom reg.vhd 
vcom testbench.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
# -radix: binary, hex, dec
# -label: nome da forma de onda
#sinais do testbench
add wave -radix bin -label clock  /clkT
add wave -radix bin -label sclr /sclr_nT
add wave -radix bin -label enable /clk_enaT
add wave -radix bin -label datain /datainT
add wave -radix bin -label output /reg_outT


#Como mostrar sinais internos do processo

#Simula até um 100ns
run 100ns

wave zoomfull
#write wave wave.ps