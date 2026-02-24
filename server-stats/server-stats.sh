#!/bin/bash
echo "Memory Usage:"
free -h | grep Mem | awk '{print "Total: ",$2,"Used:", $3, "Free:", $4}'
echo ""
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | \
awk '{usage = 100 - $8; printf "Total CPU Usage: %.1f%%\n", usage}'
echo ""
echo "Disk Usage:"
df -h | grep ' /$' | awk '{print "Total:", $2, "Used:", $3, "Free:", $4, "Usage:", $5}'
echo ""
echo "Top 5 Processes by CPU:"
ps aux --sort=-%cpu | head -n 6
echo ""
echo "Top 5 Processes by Memory:"
ps aux --sort=-%mem | head -n 6
echo ""
echo "OS Version:"
grep PRETTY_NAME /etc/os-release | cut -d '=' -f2 | tr -d '"'
