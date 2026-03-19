#helm uninstall sonarqube -n security-tools -f values-sonar.yaml

helm repo add sonarqube https://SonarSource.github.io/helm-chart-sonarqube
helm repo update
kubectl create namespace sonarqube
export MONITORING_PASSCODE="admin123"
helm upgrade --install -n sonarqube sonarqube sonarqube/sonarqube --set community.enabled=true,monitoringPasscode=$MONITORING_PASSCODE