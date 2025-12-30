# Measurement Plane Experiment Orchestrator

This repository contains the setup for deploying the Measurement Plane Experiment Orchestrator as a Docker container. The orchestrator provides an HTTP REST service for submitting, managing, and streaming the execution of measurement experiments. It coordinates experiments via a NATS message broker and exposes real-time experiment status to connected clients such as the Measurement Plane GUI.

## Prerequisites

- Docker installed on your system.
- Access to the Docker image `ghcr.io/measurement-plane/experiment-orchestrator:latest`.
- A running message broker (e.g., NATS) accessible via BROKER_URL.

## Quick Start

### 1. Clone the Repository
```bash
git clone <repo-url>
cd experiment-orchestrator-ops
```

### 2. Configure Environment Variables
You can modify the BROKER_URL default variable directly in the `run.sh` script if needed with the address of the Broker.

Example:
```bash
BROKER_URL="nats://172.17.0.1:4222"
```

### 3. Run the Application
Make the script executable and run it:

```bash
chmod +x run.sh
./run.sh
```
