#!/bin/bash

python -m venv /opt/tpu_exporter/venv
source venv/bin/activate
echo "Created exporter"
sudo chmod -R 777 /opt/tpu_exporter
echo "Chmod exporter"
sudo chmod -R 777 /opt/tpu_exporter/venv
echo "chmod venv"
/opt/tpu_exporter/venv/bin/pip install  prometheus_client google-cloud-monitoring
echo "installation done"
/opt/tpu_exporter/venv/bin/python /opt/tpu_exporter/tpu_exporter.py --variable "$1"
echo "running"
