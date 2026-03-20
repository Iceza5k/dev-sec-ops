# Argo CD

## What Is This Tool

Argo CD is a GitOps continuous delivery controller for Kubernetes. It watches application manifests in Git and keeps the cluster state in sync with what is declared there.

## How It Works

This folder contains:

- `install.sh` to install Argo CD with Helm
- `values-argocd.yaml` to configure the Argo CD server

In this repo, Argo CD is configured for local access with a `NodePort` service and the shared root ingress manifest can route `argocd.local` to the Argo CD server.

## How To Apply To Kubernetes Cluster

### Prerequisites

- Kubernetes cluster is running
- `helm` is installed

### Install Argo CD

From this folder:

```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm upgrade --install argocd argo/argo-cd -n argocd --create-namespace -f values-argocd.yaml
```

Or run:

```bash
./install.sh
```

### Current Settings In This Repo

- Namespace: `argocd`
- Service type: `NodePort`
- HTTP NodePort: `30004`
- Chart ingress disabled
- `server.insecure=true` so external ingress can proxy HTTP cleanly in this local lab

### Access Argo CD

```text
http://localhost:30004
```
