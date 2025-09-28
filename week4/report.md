# Week 4 Report

## Topics Covered

1. **GitHub Actions**

   * Automated CI/CD pipelines using GitHub Actions.
   * Created multiple jobs in workflows (`.github/workflows/`) to handle **SAST, DAST, and image scans**.
   * Practiced uploading artifacts (Bandit reports, ZAP scan results) for later review.

2. **SAST (Static Application Security Testing)**

   * Implemented **Bandit** in GitHub Actions to scan Python source code for vulnerabilities.
   * Configured Bandit with flags `-ll -ii` to detect medium/high severity issues.
   * Findings are exported to `bandit-report.json` and uploaded as an artifact.
   * Repository example: [PyGoat Actions](https://github.com/Shakeelkhuhro/pygoat/actions).

3. **DAST (Dynamic Application Security Testing)**

   * Practiced **OWASP ZAP baseline scans** against a running PyGoat container.
   * Used the official **`zaproxy/action-baseline`** GitHub Action to automate runtime scanning.
   * Generated `zap_report.html` artifacts to review vulnerabilities like XSS, CSRF, and open redirects.

4. **Image Scanning (Container Security)**

   * Integrated **Docker Scout** to check the built Docker image for known CVEs and misconfigurations.
   * Workflow builds the image and scans for vulnerabilities at the container layer.
   * Findings are displayed in GitHub Actions logs.

5. **Configuration & Release Management**

   * Reviewed practices of automating deployment pipelines and environment configuration.
   * Explored **Ansible** as a configuration management tool.
   * Studied deployment strategies such as **blue-green** and **rolling updates**.

6. **Observability Fundamentals**

   * Learned about logs, metrics, and traces as pillars of observability.
   * Explored monitoring approaches with **Prometheus and Grafana**.
   * Practiced using `curl` to inspect metrics endpoints.