# Week 4 Practical Script

# Demonstrates GitHub Actions setup, SAST (Bandit), DAST (ZAP), Image Scanning (Docker Scout),

# Config Management, and Observability basics

echo "=== Week 4 DevSecOps Demo Script ==="

# -------------------------------

# 1. GitHub Actions Workflow

echo "[GitHub Actions] Creating full security workflow..."
mkdir -p .github/workflows
cat <<EOL > .github/workflows/security-ci.yml
name: Security CI
on: [push, pull_request]

jobs:
sast_scan:
name: Run Bandit (SAST)
runs-on: ubuntu-latest
steps:
- uses: actions/checkout@v2
- uses: actions/setup-python@v2
with:
python-version: 3.8
- run: pip install bandit
- run: bandit -ll -ii -r . -f json -o bandit-report.json
- uses: actions/upload-artifact@v3
with:
name: bandit-findings
path: bandit-report.json

image_scan:
name: Build & Scan Docker Image
runs-on: ubuntu-latest
steps:
- uses: actions/checkout@v2
- run: docker build -f Dockerfile -t myapp:latest .
- run: |
curl -fsSl [https://raw.githubusercontent.com/docker/scout-cli/main/install.sh](https://raw.githubusercontent.com/docker/scout-cli/main/install.sh) -o install-scout.sh
sh install-scout.sh
docker scout quickview
docker scout cves

dast_scan:
name: Run OWASP ZAP (DAST)
runs-on: ubuntu-latest
steps:
- uses: actions/checkout@v2
- run: |
docker run -d -p 8000:8000 --name pygoat ghcr.io/owasp/pygoat:latest
sleep 20
- uses: zaproxy/action-baseline@v1
with:
target: '[http://localhost:8000](http://localhost:8000)'
format: 'html'
output: 'zap_report.html'
- uses: actions/upload-artifact@v3
with:
name: zap-report
path: zap_report.html
- run: docker stop pygoat && docker rm pygoat
EOL
echo "Security workflow created at .github/workflows/security-ci.yml"

# -------------------------------

# 2. Local SAST Example

echo "[SAST] Running Bandit locally (if installed)..."
if command -v bandit &> /dev/null
then
bandit -r . -f json -o bandit_report.json
echo "Bandit report saved as bandit_report.json"
else
echo "Bandit not installed. Install with: pip install bandit"
fi

# -------------------------------

# 3. Local DAST Example

echo "[DAST] Running OWASP ZAP against PyGoat (requires Docker + ZAP)..."
if command -v docker &> /dev/null
then
docker run -d -p 8000:8000 --name pygoat ghcr.io/owasp/pygoat:latest
sleep 15
if command -v zap-baseline.py &> /dev/null
then
zap-baseline.py -t [http://localhost:8000](http://localhost:8000) -r zap_report.html
echo "ZAP report saved as zap_report.html"
else
echo "ZAP CLI not installed locally. Use GitHub Action zaproxy/action-baseline."
fi
docker stop pygoat && docker rm pygoat
else
echo "Docker not installed. Please install Docker to run PyGoat."
fi

# -------------------------------

# 4. Config Management Example

echo "[Config Management] Checking Ansible installation..."
if command -v ansible &> /dev/null
then
ansible localhost -m ping
else
echo "Ansible not installed. Install with: sudo apt install ansible -y"
fi

# -------------------------------

# 5. Observability Example

echo "[Observability] Checking Prometheus metrics endpoint..."
curl -s [http://localhost:9090/metrics](http://localhost:9090/metrics) | head -n 10 || echo "Prometheus not running locally."

echo "=== End of Week 4 Demo Script ==="
