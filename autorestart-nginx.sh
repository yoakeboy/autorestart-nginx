#!/bin/bash
unit_file="/etc/systemd/system/nginx-restart.service"

cat <<EOL > "$unit_file"
[Unit]
Description=Restart Nginx Service
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash -c '/bin/sleep 7200 && /bin/systemctl restart nginx'
Restart=always

[Install]
WantedBy=multi-user.target
EOL

# Reload systemd
systemctl daemon-reload

# Enable dan start layanan
systemctl enable nginx-restart.service
systemctl start nginx-restart.service

# Tampilkan status layanan
clear
systemctl status nginx-restart.service

# Kembali ke menu
echo "Sukses menginstall auto-restart nginx. Tunggu 5 detik untuk kembali ke menu."
sleep 5
menu
