import time
import psutil
from google.cloud import monitoring_v3
from prometheus_client import start_http_server, Gauge

# Create Prometheus metric objects
cpu_utilization = Gauge('cpu_utilization', 'CPU Utilization Percentage')
tpu_utilization = Gauge('tpu_utilization', 'TPU Utilization Percentage')

# Google Cloud Monitoring client
client = monitoring_v3.MetricServiceClient()
project_id = "outpost-443210"
project_name = f"projects/{project_id}"

def fetch_cpu_utilization():
    # Get CPU usage
    cpu_percent = psutil.cpu_percent(interval=1)
    cpu_utilization.set(cpu_percent)

# def fetch_tpu_utilization():
#     # Get TPU usage from Cloud Monitoring API
#     interval = monitoring_v3.TimeInterval({
#         "end_time": {"seconds": int(time.time())},
#         "start_time": {"seconds": int(time.time()) - 60},  # Last 5 minutes
#     })
#     results = client.list_time_series(
#         request={
#             "name": project_name,
#             "filter": 'metric.type="cloud_tpu.googleapis.com/tpu/utilization"',
#             "interval": interval,
#             "view": monitoring_v3.ListTimeSeriesRequest.TimeSeriesView.FULL,
#         }
#     )
#     for result in results:
#         for point in result.points:
#             utilization = point.value.double_value * 100  # Convert to percentage
#             tpu_utilization.set(utilization)

if __name__ == "__main__":
    start_http_server(9102)  # Expose metrics on port 9102
    while True:
        fetch_cpu_utilization()
        # fetch_tpu_utilization()
        time.sleep(60)  # Sleep for 1 minute before fetching again
