#!/bin/bash

python -m venv venv
source /path/to/venv/bin/activate

pip install  prometheus_client google-cloud-monitoring
# Run the Python file
python /opt/tpu_exporter/tpu_exporter.py --variable "$1"
