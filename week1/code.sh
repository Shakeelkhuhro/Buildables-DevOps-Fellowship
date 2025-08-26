# Basic Linux file operations

pwd
mkdir devops_practice
cd devops_practice
touch hello.txt
echo "Learning DevOps" > hello.txt
cat hello.txt
cp hello.txt hello_backup.txt
mv hello.txt hello_renamed.txt
rm hello_backup.txt


# Simple greeting script

echo "Hello $(whoami), welcome to DevOps!"

#!/bin/bash
# Network connectivity check

echo "Hello, this is a network connectivity check."
ping google.com

curl -s ifconfig.me

# Active network interfaces check
ip a



# User management script

sudo adduser devuser
sudo passwd devuser
sudo usermod -aG sudo devuser


# System monitoring script

# Disk Usage
df -h

# Memory Usage
free -m

# System Uptime
uptime
