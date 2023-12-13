#!/usr/bin/env bash
# ----------------------------------------------------------
# Author:          damiancypcar
# Modified:        2023-12-13
# Version:         1.1
# Desc:            Monitors Raspberry Pi CPU clock speed and temperature.
# ----------------------------------------------------------

set -euo pipefail

cpu_freq=/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
cpu_temp=/sys/class/thermal/thermal_zone0/temp
if [ -e $cpu_freq ] ; then
  if [ -e $cpu_temp ] ; then
    while true ; do
      clk=$(cat $cpu_freq)
      cpu=$(cat $cpu_temp)
      echo -ne "    cpu: $((clk/1000)) Mhz    temp: $((cpu/1000)) C \r"
      sleep 1
    done
  fi
fi
