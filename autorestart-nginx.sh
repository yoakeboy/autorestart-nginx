#!/bin/bash
unit_file="/etc/systemd/system/nginx-restart.service"

cat <<EOL > $unit_file
[Unit]
Description=Restart Nginx Service
After=network.target

[Service]
ExecStart=/bin/bash -c '/bin/sleep 180 && /bin/systemctl restart nginx'
Restart=always
RestartSec=0

[Install]
WantedBy=default.target
EOL

# Reload systemd
systemctl daemon-reload

# Enable dan start layanan
systemctl enable nginx-restart.service
systemctl start nginx-restart.service

# Tampilkan status layanan
systemctl status nginx-restart.service
