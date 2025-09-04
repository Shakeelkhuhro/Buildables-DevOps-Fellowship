# Week 2 Practical Commands

git init
git add .
git commit -m "Week2 practicals"
git branch feature-branch
git checkout feature-branch
git checkout main

# Loop
for i in {1..3}; do
  echo "Iteration $i - DevOps practice"
done

# If condition
if [ -f "file.txt" ]; then
  echo "file exists"
else
  echo "file not found, creating..."
  echo "Hello" > file.txt
fi

# Backup
mkdir -p $HOME/backups
cp -r $HOME/week1 $HOME/backups/week1_backup_$(date +%F_%H-%M-%S)


# Firewall
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443
sudo ufw status

# System monitor
top -bn1 | head -n 10
free -h

# AWS
echo "AWS S3 Buckets:"
aws s3 ls || echo "AWS CLI configuraton fail"

# Azure CLI
echo "Azure Resource Groups:"
az group list || echo "Azure CLI not login"

# DigitalOcean CLI
echo "DigitalOcean Droplets:"
doctl compute droplet list || echo "DigitalOcean CLI not setup"