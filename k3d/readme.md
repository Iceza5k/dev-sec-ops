# k3d

## What Is This Tool

k3d is a lightweight tool for running K3s Kubernetes clusters inside Docker containers. It is useful for local development, testing, demos, and small lab environments.

In this project, k3d is used to create the Kubernetes cluster where Jenkins, SonarQube, Harbor, and DefectDojo are installed.

## How It Works

This folder contains:

- `start.sh` to create a local cluster

The script creates a cluster named `my-cluster` using this K3s image:

```text
rancher/k3s:v1.22.7-k3s1-amd64
```

The cluster has:

- 1 server node
- 1 agent node

## When We Need It

Use k3d when you need:

- a fast local Kubernetes cluster
- a simple environment for DevSecOps tool testing
- a low-cost setup for learning Kubernetes and CI/CD integration

## How To Apply To Kubernetes Cluster

For k3d, this step is the cluster creation itself.

### Prerequisites

- Docker is installed and running
- `k3d` is installed

### Create The Cluster

From this folder:

```bash
DOCKER_DEFAULT_PLATFORM=linux/amd64 k3d cluster create --image rancher/k3s:v1.22.7-k3s1-amd64 my-cluster \
  --servers 1 \
  --agents 1
```

Or run:

```bash
./start.sh
```

### Verify The Cluster

```bash
kubectl get nodes
kubectl get pods -A
```

## Notes

- This repo uses a local lab cluster, not a production-grade Kubernetes environment.
- The script does not install an Ingress controller.
- After the cluster is ready, the other folders in this repository can be applied with Helm.
