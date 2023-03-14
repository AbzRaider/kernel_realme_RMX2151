14 March 2023
RELEASE-STATUS - BETA v1.5 

Changelog:
Drop threaded operations on battery routines Allow drivers to tweak TSQ logic ( Improve Wifi Stability )
treewide: Drop non oppo6785 project
mt6785/thermal : Update CPU Throttle Trip Levels
drivers: mtk-watchdog: Drop cpu cbit printing
drivers: mtk-smi: Use proper printing apis 
drivers/misc: mediatek: Don't select HW_RANDOM and PSI by default
misc: mediatek: Unselect MEMCG & MEMCG_SWAP
RMX2151:DEFCONFIG: DISABLE MTK_MLOG 
defconfig: RM6785: Disable SLUB per-CPU partial caches
mediatek: sensor-1.0: decrease gyroscope delay
defconfig: MT6785: Remove console args from cmdline
cpumask: Add cpumasks for big and LITTLE CPU clusters
cpumask : Adapt for MT6785
tty/serial/8250: Nuke function to disable UART 
( Fixes Kernel Panic )
[MTK-ALPS] sched:change frequency immediately after enqueue task .
mediatek / thermal / mt6785 : Allow CPU to use alloted power budget.
drivers : mediatek : thermal : Enable MTK Thermal Performance Mode by default
Optimize compiler specific instructions for coupled A76.A55 
input: use -O3 Optimization for all input sources 
Silence a lot of debug
Fixed up other broken features ( Dead Hotspot )

