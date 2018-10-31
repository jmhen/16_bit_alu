set projDir "/home/jmhen/mojo/16_bit_alu/work/planAhead"
set projName "16_bit_alu"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/jmhen/mojo/16_bit_alu/work/verilog/mojo_top_0.v" "/home/jmhen/mojo/16_bit_alu/work/verilog/reset_conditioner_1.v" "/home/jmhen/mojo/16_bit_alu/work/verilog/multi_seven_seg_2.v" "/home/jmhen/mojo/16_bit_alu/work/verilog/alu_3.v" "/home/jmhen/mojo/16_bit_alu/work/verilog/sequential display_4.v" "/home/jmhen/mojo/16_bit_alu/work/verilog/counter_5.v" "/home/jmhen/mojo/16_bit_alu/work/verilog/seven_seg_6.v" "/home/jmhen/mojo/16_bit_alu/work/verilog/decoder_7.v" "/home/jmhen/mojo/16_bit_alu/work/verilog/adder16_8.v" "/home/jmhen/mojo/16_bit_alu/work/verilog/shifter16_9.v" "/home/jmhen/mojo/16_bit_alu/work/verilog/boolean16_10.v" "/home/jmhen/mojo/16_bit_alu/work/verilog/compare16_11.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list  "/home/jmhen/Desktop/tools/mojo-ide-B1.3.6/library/components/mojo.ucf" "/home/jmhen/Desktop/tools/mojo-ide-B1.3.6/library/components/io_shield.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
