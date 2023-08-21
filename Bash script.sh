#/bin/bash

sudo dnf install -y https:/ /s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm

sudo systemctl enable amazon-ssm-agentpm 

sudo systemctl start amazon-ssm-agent
