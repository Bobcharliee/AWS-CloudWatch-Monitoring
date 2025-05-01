# AWS-CloudWatch-Monitoring
Built a CloudWatch dashboard to monitor an EC2 instance running a simple Python web app, with SNS alerts for high CPU usage. Automated setup with Bash and documented a runbook for SRE triage.

## Setup
1. Launched EC2 t2.micro with Amazon Linux 2.
2. Installed and Launched Python Flask app using `setup_webapp.sh`. setup_webapp.sh runs a few processes like updating the machine, installing python3, pip3 & flask. It also contains the simple python application to be ran by the machine. After all dependencies have been installed, the script runs the python app in the background with a no-hangup signal.
3. Configured CloudWatch dashboard for CPU/Disk metrics.
4. Set up SNS email alerts for CPU > 75%.
5. Secured with IAM policy.
## Overloading CPU Manually
Inother maximize CPU Utilization, a large amount of traffic was sent to the application following these steps:
1. Connected to the EC2 instance via ssh
2. Change EC2_user to root using, `sudo -i`
3. ran `yes > /dev/null` . This command will increase cpu utilization to 99% thereby triggering CloudWatch alarm and SNS

## Runbook
High CPU Alert Triage:
1. Check CloudWatch dashboard for CPU spike details.
2. Verify SNS email alert.
3. SSH into EC2 and run `top` to identify processes.
4. Escalate to SRE if unresolved after 10 minutes.

## Results
Enabled proactive monitoring using CLoudWatch alarms & notification using SNS and clear triage steps for SRE teams.

## Screenshots
- [Dashboard](CloudWatch_dashboard.png)
- [Alert](sns_alert.png)
