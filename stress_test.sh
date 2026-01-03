#!/bin/bash
# This script spikes the CPU utilization to trigger an AWS Auto Scaling event.

echo "Initiating CPU stress test..."
# Runs random data through high-level compression to consume CPU cycles
cat /dev/urandom | gzip -9 > /dev/null &

echo "Stress test running in background. Monitor your AWS Console for Scale-Out activity."
