# Jenkins

## What Is This Tool

Jenkins is a CI/CD server. It runs build pipelines, automates testing, builds container images, and connects different DevSecOps tools into one workflow.

In this project, Jenkins is the main automation engine.

## How It Works

This folder contains:

- `install.sh` to install Jenkins into Kubernetes with Helm
- `values-jenkins.yaml` to configure the Jenkins Helm chart
- `Jenkinsfile` to define the CI pipeline

In this repo, Jenkins does the following:

1. Clones a demo Node.js application.
2. Installs dependencies for `client` and `backend`.
3. Runs tests if they exist.
4. Sends source code to SonarQube for static analysis.
5. Builds a Docker image.
6. Scans the image with Trivy.
7. Optionally pushes the image to Harbor.
8. Optionally imports the Trivy result into DefectDojo.

The Jenkins pipeline runs on a Kubernetes agent pod with multiple containers:

- `nodejs`
- `docker-cli`
- `trivy`
- `curl`

## When We Need It

Use Jenkins when you need:

- automatic build and test execution
- repeatable CI/CD pipelines
- integration between code scanning, image scanning, registry push, and security reporting
- a central place to run DevSecOps workflows

## How To Apply To Kubernetes Cluster

### Prerequisites

- Kubernetes cluster is running
- `helm` is installed
- Jenkins Helm repository is added

If needed, add the repo:

```bash
helm repo add jenkins https://charts.jenkins.io
helm repo update
```

### Install Jenkins

From this folder:

```bash
helm install jenkins jenkins/jenkins -n jenkins --create-namespace -f values-jenkins.yaml
```

Or run:

```bash
./install.sh
```

### Current Settings In This Repo

- Namespace: `jenkins`
- Service type: `NodePort`
- Port: `30003`
- Admin password in values file: `admin`
- Persistent storage: `5Gi`

### Access Jenkins

If your cluster exposes NodePort directly:

```text
http://localhost:30003
```

### Apply The Pipeline

After Jenkins is running:

1. Create a new Pipeline job in Jenkins.
2. Copy the content from `Jenkinsfile` or load it from source control.
3. Create required Jenkins credentials:
   - `harbor-credentials`
   - `defectdojo-api-token`
   - `sonar`
4. Run the pipeline.

## Notes

- `install.sh` currently contains an extra line after the Helm command that should be removed before sharing this repo.
- This setup mounts the host Docker socket in Jenkins agents. That is convenient for labs, but not ideal for production.
