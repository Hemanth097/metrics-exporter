#!/bin/bash
sudo apt update
sudo apt install python3
sudo apt install python3-venv
sudo apt install python3-pip
python3 -m venv venv
source venv/bin/activate
echo "Created exporter"
sudo chmod -R 777 /opt/tpu_exporter
echo "Chmod exporter"
sudo chmod -R 777 /opt/tpu_exporter/venv
echo "chmod venv"
/opt/tpu_exporter/venv/bin/pip3 install  prometheus_client google-cloud-monitoring
echo "installation done"
/opt/tpu_exporter/venv/bin/python3 /opt/tpu_exporter/tpu_exporter.py --variable "$1"
echo "running"
