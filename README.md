# AWS-ec2-autoscaling-project
A hands-on lab demonstrating AWS EC2 Auto Scaling with CPU stress testing.
# AWS EC2 Dynamic Auto Scaling & Stress Testing Lab

## 📌 Project Overview
This project demonstrates the implementation of a highly available and elastic web infrastructure using **AWS EC2 Auto Scaling Groups (ASG)**. I configured a system that automatically adjusts capacity based on real-time CPU demand to optimize performance and cost.

## 🛠️ Technical Implementation
### 1. Launch Template Configuration
- **AMI:** Amazon Linux 2023
- **Instance Type:** t2.micro (Free Tier)
- **User Data Script:** Automated the installation and startup of an Apache HTTP Server (`httpd`) to serve a custom landing page.

### 2. Auto Scaling Group (ASG) Setup
- **Multi-AZ Deployment:** Configured across multiple Availability Zones for fault tolerance.
- **Scaling Policy:** **Target Tracking Scaling Policy**.
  - **Metric:** Average CPU Utilization.
  - **Target Value:** 50%.
  - **Instance Warmup:** 60 seconds.

### 3. Dynamic Scaling Lifecycle
- **Scale-Out:** Successfully triggered by manually spiking CPU utilization to ~100% using a Linux stress command. AWS CloudWatch monitored the breach of the 50% threshold and automatically provisioned additional instances.
- **Scale-In:** After terminating the stress processes, I observed the system return to a steady state as CPU utilization dropped below the threshold.

## 🚀 Key Commands Used
- **To Stress CPU:** `cat /dev/urandom | gzip -9 > /dev/null &`
- **To Monitor Load:** `top`
- **To Stop Stress:** `killall gzip`

## 📉 Lessons Learned
- Understanding the importance of **Instance Warmup** to prevent scaling "thrashing."
- Configuring **Security Groups** to allow HTTP (Port 80) traffic for web accessibility.
- Practical experience with **CloudWatch Alarms** and dynamic resource allocation.
