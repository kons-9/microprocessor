
q
Command: %s
53*	vivadotcl2@
,synth_design -top cpu -part xc7a200tsbg484-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a200t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a200t2default:defaultZ17-349h px� 
W
Loading part %s157*device2$
xc7a200tsbg484-12default:defaultZ21-403h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
42default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
^
#Helper process launched with PID %s4824*oasys2
6142default:defaultZ8-7075h px� 
�
,redeclaration of ansi port %s is not allowed2611*oasys2!
branch_signal2default:default2:
$/home/denjo/risc/source/30_execute.v2default:default2
652default:default8@Z8-2611h px� 
�
%s has already been declared976*oasys2!
branch_signal2default:default2:
$/home/denjo/risc/source/30_execute.v2default:default2
652default:default8@Z8-976h px� 
�
 second declaration of %s ignored2654*oasys2!
branch_signal2default:default2:
$/home/denjo/risc/source/30_execute.v2default:default2
652default:default8@Z8-2654h px� 
�
%s is declared here994*oasys2!
branch_signal2default:default2:
$/home/denjo/risc/source/30_execute.v2default:default2
332default:default8@Z8-994h px� 
�
%s*synth2�
�Starting RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:04 . Memory (MB): peak = 2123.316 ; gain = 0.000 ; free physical = 6998 ; free virtual = 12785
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2
cpu2default:default2
 2default:default26
 /home/denjo/risc/source/00_cpu.v2default:default2
132default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
fetch2default:default2
 2default:default28
"/home/denjo/risc/source/10_fetch.v2default:default2
62default:default8@Z8-6157h px� 
�
%s
*synth2x
d	Parameter FILENAME bound to: /home/denjo/risc/b3exp/benchmarks/tests/Uart/code.hex - type: string 
2default:defaulth p
x
� 
�
,$readmem data file '%s' is read successfully3426*oasys2I
5/home/denjo/risc/b3exp/benchmarks/tests/Uart/code.hex2default:default28
"/home/denjo/risc/source/10_fetch.v2default:default2
302default:default8@Z8-3876h px� 
�
synthesizing module '%s'%s4497*oasys2
	sequencer2default:default2
 2default:default2<
&/home/denjo/risc/source/11_sequencer.v2default:default2
52default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	sequencer2default:default2
 2default:default2
12default:default2
12default:default2<
&/home/denjo/risc/source/11_sequencer.v2default:default2
52default:default8@Z8-6155h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default28
"/home/denjo/risc/source/10_fetch.v2default:default2
512default:default8@Z8-589h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
fetch2default:default2
 2default:default2
22default:default2
12default:default28
"/home/denjo/risc/source/10_fetch.v2default:default2
62default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
decoder2default:default2
 2default:default2:
$/home/denjo/risc/source/20_decoder.v2default:default2
52default:default8@Z8-6157h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default2:
$/home/denjo/risc/source/20_decoder.v2default:default2
732default:default8@Z8-589h px� 
�
default block is never used226*oasys2:
$/home/denjo/risc/source/20_decoder.v2default:default2
912default:default8@Z8-226h px� 
�
default block is never used226*oasys2:
$/home/denjo/risc/source/20_decoder.v2default:default2
1242default:default8@Z8-226h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
decoder2default:default2
 2default:default2
32default:default2
12default:default2:
$/home/denjo/risc/source/20_decoder.v2default:default2
52default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
execute2default:default2
 2default:default2:
$/home/denjo/risc/source/30_execute.v2default:default2
62default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
alu2default:default2
 2default:default26
 /home/denjo/risc/source/31_alu.v2default:default2
52default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
alu2default:default2
 2default:default2
42default:default2
12default:default26
 /home/denjo/risc/source/31_alu.v2default:default2
52default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
execute2default:default2
 2default:default2
52default:default2
12default:default2:
$/home/denjo/risc/source/30_execute.v2default:default2
62default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
datamem2default:default2
 2default:default2:
$/home/denjo/risc/source/40_datamem.v2default:default2
52default:default8@Z8-6157h px� 
�
<%s inside initial block, initial block items will be ignored4742*oasys2/
loop limit (65536) exceeded2default:default2:
$/home/denjo/risc/source/40_datamem.v2default:default2
462default:default8@Z8-6896h px� 
�
synthesizing module '%s'%s4497*oasys2
load2default:default2
 2default:default27
!/home/denjo/risc/source/41_load.v2default:default2
52default:default8@Z8-6157h px� 
�
default block is never used226*oasys27
!/home/denjo/risc/source/41_load.v2default:default2
242default:default8@Z8-226h px� 
�
default block is never used226*oasys27
!/home/denjo/risc/source/41_load.v2default:default2
332default:default8@Z8-226h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
load2default:default2
 2default:default2
62default:default2
12default:default27
!/home/denjo/risc/source/41_load.v2default:default2
52default:default8@Z8-6155h px� 
�
default block is never used226*oasys2:
$/home/denjo/risc/source/40_datamem.v2default:default2
572default:default8@Z8-226h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
datamem2default:default2
 2default:default2
72default:default2
12default:default2:
$/home/denjo/risc/source/40_datamem.v2default:default2
52default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
regfile2default:default2
 2default:default2:
$/home/denjo/risc/source/99_regfile.v2default:default2
52default:default8@Z8-6157h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
!==2default:default2
!=2default:default2:
$/home/denjo/risc/source/99_regfile.v2default:default2
262default:default8@Z8-589h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
regfile2default:default2
 2default:default2
82default:default2
12default:default2:
$/home/denjo/risc/source/99_regfile.v2default:default2
52default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2"
hazard_control2default:default2
 2default:default2A
+/home/denjo/risc/source/99_hazard_control.v2default:default2
32default:default8@Z8-6157h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default2A
+/home/denjo/risc/source/99_hazard_control.v2default:default2
452default:default8@Z8-589h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default2A
+/home/denjo/risc/source/99_hazard_control.v2default:default2
472default:default8@Z8-589h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default2A
+/home/denjo/risc/source/99_hazard_control.v2default:default2
452default:default8@Z8-589h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default2A
+/home/denjo/risc/source/99_hazard_control.v2default:default2
472default:default8@Z8-589h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2"
hazard_control2default:default2
 2default:default2
92default:default2
12default:default2A
+/home/denjo/risc/source/99_hazard_control.v2default:default2
32default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2$
hardware_counter2default:default2
 2default:default2C
-/home/denjo/risc/source/99_hardware_counter.v2default:default2
62default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2$
hardware_counter2default:default2
 2default:default2
102default:default2
12default:default2C
-/home/denjo/risc/source/99_hardware_counter.v2default:default2
62default:default8@Z8-6155h px� 
�
&Input port '%s' has an internal driver4442*oasys2
uart_tx2default:default26
 /home/denjo/risc/source/00_cpu.v2default:default2
2152default:default8@Z8-6104h px� 
�
synthesizing module '%s'%s4497*oasys2
uart2default:default2
 2default:default27
!/home/denjo/risc/source/99_uart.v2default:default2
12default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
uart2default:default2
 2default:default2
112default:default2
12default:default27
!/home/denjo/risc/source/99_uart.v2default:default2
12default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
cpu2default:default2
 2default:default2
122default:default2
12default:default26
 /home/denjo/risc/source/00_cpu.v2default:default2
132default:default8@Z8-6155h px� 
�
%s*synth2�
�Finished RTL Elaboration : Time (s): cpu = 00:00:07 ; elapsed = 00:00:09 . Memory (MB): peak = 2200.473 ; gain = 77.156 ; free physical = 7191 ; free virtual = 12980
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:08 ; elapsed = 00:00:10 . Memory (MB): peak = 2200.473 ; gain = 77.156 ; free physical = 7203 ; free virtual = 12985
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:08 ; elapsed = 00:00:10 . Memory (MB): peak = 2200.473 ; gain = 77.156 ; free physical = 7203 ; free virtual = 12985
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.022default:default2
00:00:00.012default:default2
2200.4732default:default2
0.0002default:default2
71932default:default2
129752default:defaultZ17-722h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
z
Parsing XDC File [%s]
179*designutils29
#/home/denjo/risc/practice/nexys.xdc2default:default8Z20-179h px� 
�
No ports matched '%s'.
584*	planAhead2
led[0]2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
222default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
222default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
led[1]2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
232default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
232default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
led[2]2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
242default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
242default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
led[3]2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
252default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
252default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
led[4]2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
262default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
262default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
led[5]2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
272default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
272default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
led[6]2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
282default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
282default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
led[7]2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
292default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
292default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[0]2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
422default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
422default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[1]2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
432default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
432default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[2]2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
442default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
442default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[3]2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
452default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
452default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[4]2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
462default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
462default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[5]2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
472default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
472default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[6]2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
482default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
482default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[7]2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
492default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
492default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
uart_rx_out2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
1532default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default29
#/home/denjo/risc/practice/nexys.xdc2default:default2
1532default:default8@Z17-55h px�
�
Finished Parsing XDC File [%s]
178*designutils29
#/home/denjo/risc/practice/nexys.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project27
#/home/denjo/risc/practice/nexys.xdc2default:default2)
.Xil/cpu_propImpl.xdc2default:defaultZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2300.3162default:default2
0.0002default:default2
71002default:default2
128822default:defaultZ17-722h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common24
 Constraint Validation Runtime : 2default:default2
00:00:00.012default:default2
00:00:002default:default2
2300.3162default:default2
0.0002default:default2
71002default:default2
128822default:defaultZ17-722h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Constraint Validation : Time (s): cpu = 00:00:13 ; elapsed = 00:00:16 . Memory (MB): peak = 2300.316 ; gain = 177.000 ; free physical = 7181 ; free virtual = 12963
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Loading part: xc7a200tsbg484-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:13 ; elapsed = 00:00:16 . Memory (MB): peak = 2300.316 ; gain = 177.000 ; free physical = 7181 ; free virtual = 12963
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:13 ; elapsed = 00:00:16 . Memory (MB): peak = 2300.316 ; gain = 177.000 ; free physical = 7181 ; free virtual = 12963
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:15 ; elapsed = 00:00:18 . Memory (MB): peak = 2300.316 ; gain = 177.000 ; free physical = 7171 ; free virtual = 12954
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit       Adders := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input   32 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    4 Bit       Adders := 1     
2default:defaulth p
x
� 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     32 Bit         XORs := 1     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               32 Bit    Registers := 12    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                9 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                5 Bit    Registers := 5     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                4 Bit    Registers := 3     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                3 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                2 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 6     
2default:defaulth p
x
� 
8
%s
*synth2 
+---RAMs : 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	             1024 Bit	(32 X 32 bit)          RAMs := 1     
2default:defaulth p
x
� 
8
%s
*synth2 
+---ROMs : 
2default:defaulth p
x
� 
P
%s
*synth28
$	                    ROMs := 1     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit        Muxes := 11    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input   32 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input   32 Bit        Muxes := 8     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   29 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    9 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  10 Input    5 Bit        Muxes := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   8 Input    4 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  10 Input    4 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  10 Input    3 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    3 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  10 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    2 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  10 Input    1 Bit        Muxes := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2m
YPart Resources:
DSPs: 740 (col length:100)
BRAMs: 730 (col length: RAMB18 100 RAMB36 50)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
uart_tx2default:default2
1st2default:default2'
uart0/uart_tx_reg/Q2default:default27
!/home/denjo/risc/source/99_uart.v2default:default2
442default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
uart_tx2default:default2
2nd2default:default2
uart_tx2default:default26
 /home/denjo/risc/source/00_cpu.v2default:default2
132default:default8@Z8-6859h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:02:13 ; elapsed = 00:02:16 . Memory (MB): peak = 2300.316 ; gain = 177.000 ; free physical = 7090 ; free virtual = 12879
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP and Shift Register Reporting
2default:defaulth px� 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px� 
M
%s*synth25
!
ROM: Preliminary Mapping	Report
2default:defaulth px� 
l
%s*synth2T
@+------------+---------------+---------------+----------------+
2default:defaulth px� 
m
%s*synth2U
A|Module Name | RTL Object    | Depth x Width | Implemented As | 
2default:defaulth px� 
l
%s*synth2T
@+------------+---------------+---------------+----------------+
2default:defaulth px� 
m
%s*synth2U
A|cpu         | fetch0/ir_reg | 32768x32      | Block RAM      | 
2default:defaulth px� 
m
%s*synth2U
A+------------+---------------+---------------+----------------+

2default:defaulth px� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP and Shift Register Reporting
2default:defaulth px� 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:02:18 ; elapsed = 00:02:22 . Memory (MB): peak = 2300.316 ; gain = 177.000 ; free physical = 7139 ; free virtual = 12929
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Timing Optimization : Time (s): cpu = 00:02:18 ; elapsed = 00:02:22 . Memory (MB): peak = 2300.316 ; gain = 177.000 ; free physical = 7139 ; free virtual = 12929
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Technology Mapping : Time (s): cpu = 00:02:18 ; elapsed = 00:02:22 . Memory (MB): peak = 2300.316 ; gain = 177.000 ; free physical = 7138 ; free virtual = 12928
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished IO Insertion : Time (s): cpu = 00:02:20 ; elapsed = 00:02:24 . Memory (MB): peak = 2300.316 ; gain = 177.000 ; free physical = 7117 ; free virtual = 12924
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:02:20 ; elapsed = 00:02:24 . Memory (MB): peak = 2300.316 ; gain = 177.000 ; free physical = 7117 ; free virtual = 12924
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:02:20 ; elapsed = 00:02:24 . Memory (MB): peak = 2300.316 ; gain = 177.000 ; free physical = 7117 ; free virtual = 12924
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:02:20 ; elapsed = 00:02:24 . Memory (MB): peak = 2300.316 ; gain = 177.000 ; free physical = 7117 ; free virtual = 12924
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:02:20 ; elapsed = 00:02:24 . Memory (MB): peak = 2300.316 ; gain = 177.000 ; free physical = 7117 ; free virtual = 12923
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:02:20 ; elapsed = 00:02:24 . Memory (MB): peak = 2300.316 ; gain = 177.000 ; free physical = 7117 ; free virtual = 12923
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
=
%s*synth2%
+-+-----+------+
2default:defaulth px� 
=
%s*synth2%
| |Cell |Count |
2default:defaulth px� 
=
%s*synth2%
+-+-----+------+
2default:defaulth px� 
=
%s*synth2%
+-+-----+------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:02:20 ; elapsed = 00:02:24 . Memory (MB): peak = 2300.316 ; gain = 177.000 ; free physical = 7117 ; free virtual = 12923
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 2 critical warnings and 0 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Runtime : Time (s): cpu = 00:02:18 ; elapsed = 00:02:22 . Memory (MB): peak = 2300.316 ; gain = 77.156 ; free physical = 7169 ; free virtual = 12976
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:02:20 ; elapsed = 00:02:24 . Memory (MB): peak = 2300.316 ; gain = 177.000 ; free physical = 7169 ; free virtual = 12976
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2300.3162default:default2
0.0002default:default2
71622default:default2
129692default:defaultZ17-722h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2300.3162default:default2
0.0002default:default2
71872default:default2
129922default:defaultZ17-722h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
442default:default2
272default:default2
212default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
synth_design: 2default:default2
00:02:292default:default2
00:02:302default:default2
2300.3162default:default2
177.1252default:default2
73292default:default2
131342default:defaultZ17-722h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2V
B/home/denjo/risc/work/stateachine/stateachine.runs/synth_1/cpu.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2p
\Executing : report_utilization -file cpu_utilization_synth.rpt -pb cpu_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Mon Nov  9 22:46:07 20202default:defaultZ17-206h px� 


End Record