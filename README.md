# Spark on k8s  
Just a simple example with oversimplistic gitlab ci.

## Installation
helm install --name gitlab --set baseDomain=gitlab,legoEmail=email@localhost.com gitlab/gitlab-omnibus

## We need to replace GCE storage with hostpath for local tests
kubectl describe StorageClass gitlab-gitlab-fast
kubectl delete StorageClass gitlab-gitlab-fast
kubectl apply -f PV.yaml

## Also generate self-signed certs (or better get ones from let's encrypt) and create secret in k8s
## See tls_secret.yaml

## As we don't have our names registered in external DNS, we append /etc/hosts
## For this we need to find a current IP address gitlab listens to 
kubectl get svc

kubectl apply -f cm.yaml

kubectl get pods -l app=gitlab-gitlab-runner

kubectl delete pod -l app=gitlab-gitlab-runner

## Check the gitlab pipeline

## Verify the logs. Look for pi ;)
kubectl -n=spark logs -f <driver-pod-name>
