#!/bin/bash
sudo apt update
sudo apt install python3
sudo apt install python3-pip
python3 -m venv venv

sudo chmod -R 777 /opt/tpu_exporter/venv
/opt/tpu_exporter/venv/bin/pip3 install  prometheus_client google-cloud-monitoring
/opt/tpu_exporter/venv/bin/python3 /opt/tpu_exporter/tpu_exporter.py --variable "$1"
