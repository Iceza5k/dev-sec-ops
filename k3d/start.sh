DOCKER_DEFAULT_PLATFORM=linux/amd64 k3d cluster create --image rancher/k3s:v1.22.7-k3s1-amd64 my-cluster \
  --servers 1 \
  --agents 1 