# CLOUD818N-GROUP11-ENDSEM

This repository documents the step-by-step implementation of an end-to-end cloud-based monitoring and alerting solution deployed on AWS EKS. It is structured into distinct phases to simplify understanding and execution.

---

## **Repository Structure**

### **Phase-1: CloudFormation Templates**
This phase focuses on infrastructure setup using AWS CloudFormation. It includes the following:
- **Objective**: Automate the creation of Kubernetes infrastructure on AWS EKS.
- **Details**:
  - VPC creation.
  - EKS cluster provisioning.
  - Node group setup for worker nodes.
  - IAM roles and permissions for Kubernetes services.
- **Outputs**:
  - Fully functional EKS cluster ready for application deployment.

### **Phase-2: YAML Splitting**
In this phase, we organized and optimized Kubernetes manifests for better scalability and maintainability.
- **Objective**: Split the original monolithic Kubernetes YAML file into structured components.
- **Details**:
  - Organized manifests into subdirectories by functionality:
    - **Namespaces**: Namespace definitions.
    - **Core Components**: Service accounts, cluster roles, bindings, and deployments.
    - **Application Services**: Application-specific YAML files.
  - Separated config maps, services, and deployments into distinct files.
- **Outputs**:
  - Cleaner and modular Kubernetes YAML structure.

### **Phase-4: Grafana Monitoring**
This phase enhances monitoring and alerting using Prometheus, Grafana, and OpenTelemetry.
- **Objective**: Set up robust monitoring for the Kubernetes cluster and applications with extended dashboards and alerting mechanisms.
- **Details**:
  1. **Prometheus Setup**:
     - Enabled additional exporters for kube-state, node metrics, and storage monitoring.
     - Configured scrape targets in Prometheus.
  2. **Grafana Dashboards**:
     - Added dashboards for:
       - Cluster-level metrics (CPU, memory, disk I/O).
       - Node-level metrics (availability, performance).
       - Pod-level metrics (CPU, memory, restarts).
       - Network and storage metrics.
  3. **Alerting via Amazon SES**:
     - Configured Grafana to use Amazon SES for sending email alerts.
     - Tested alerts for CPU usage, pod restarts, and service latency.
  4. **Load Testing**:
     - Simulated 200 concurrent users using JMeter to validate real-time metrics under load.
     - Observed and analyzed impacts on dashboards (e.g., CPU, disk I/O, latency).

- **Outputs**:
  - Customized Grafana dashboards with real-time metrics.
  - Configured email alerts for critical thresholds.

---

## **How to Use This Repository**

1. Clone the repository:
   ```bash
   git clone <repository_url>
   ```

2. Navigate to the required phase folder:
   - **Phase-1**: Infrastructure setup using CloudFormation.
   - **Phase-2**: Kubernetes YAML configuration.
   - **Phase-4**: Monitoring and alerting setup.

3. Follow the README or documentation in each phase folder for step-by-step instructions.

---

## **Technologies Used**
- **AWS**: EKS, CloudFormation, SES.
- **Kubernetes**: Orchestrating containerized applications.
- **Helm**: Package manager for Kubernetes.
- **Prometheus**: Metrics collection and alerting.
- **Grafana**: Visualization and alerting.
- **JMeter**: Load testing tool.

---

## **Contributors**
- Group 11 Team Members:
  - Manav Gupta
  - Jayesh Pamnani
  - Chetan Kumar
  - Sagar Wagh