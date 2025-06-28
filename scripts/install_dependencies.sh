# #!/bin/bash
# echo "Nginx is already installed via EC2 user data. Skipping installation step."
# exit 0

#!/bin/bash

# Log start
echo "[INFO] Starting install_dependencies.sh"

# Install CloudWatch Agent
echo "[INFO] Installing CloudWatch Agent..."
yum install -y amazon-cloudwatch-agent

# Create a minimal config (optional: update this for metrics/logs)
cat <<EOF > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
{
  "logs": {
    "logs_collected": {
      "files": {
        "collect_list": [
          {
            "file_path": "/var/log/messages",
            "log_group_name": "/aws/ec2/system/messages",
            "log_stream_name": "{instance_id}"
          }
        ]
      }
    }
  }
}
EOF

# Start CloudWatch Agent
echo "[INFO] Starting CloudWatch Agent..."
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
  -a fetch-config -m ec2 \
  -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json \
  -s

echo "[INFO] CloudWatch Agent setup complete"
exit 0

