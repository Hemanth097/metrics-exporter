#!/bin/bash

source venv/bin/activate

pip install  prometheus_client google-cloud-monitoring
python /opt/tpu_exporter/tpu_exporter.py --variable "$1"
