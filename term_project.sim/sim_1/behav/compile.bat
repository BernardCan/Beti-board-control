@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
echo "xvlog -m64 --relax -L xil_defaultlib -prj test_bench_lfsr_vlog.prj"
call %xv_path%/xvlog  -m64 --relax -L xil_defaultlib -prj test_bench_lfsr_vlog.prj -log xvlog.log
call type xvlog.log > compile.log
if "%errorlevel%"=="1" goto END
if "%errorlevel%"=="0" goto SUCCESS
:END
exit 1
:SUCCESS
exit 0
