#!/bin/bash
sudo apt update
sudo apt install python3
sudo apt install python3-pip
python3 -m venv venv
source venv/bin/activate

pip install  prometheus_client google-cloud-monitoring
python /opt/tpu_exporter/tpu_exporter.py --variable "$1"
