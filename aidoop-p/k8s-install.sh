#!/bin/bash
# install NGINX Ingress Controller
# https://kubernetes.github.io/ingress-nginx/deploy

# The context is different for each cloud platform.
# You can set this with an argument(-c|--context) for cloud platforms like aws, azure and eks.
# current-context is default value.

BLUE='\033[0;34m'
NC='\033[0m' # No Color
CTX=$(kubectl config current-context)

while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    -c=*|--context=*)
    CTX="${key#*=}"
    ;;
    --default)
    ;;
esac
done

echo "${BLUE}current-context: ${NC}${CTX}"
if test "${CTX}" = "docker-desktop" \
    -o "${CTX}" = "development" \
    -o "${CTX}" = "dev" \
    -o "${CTX}" = "azure" \
    -o "${CTX}" = "gke"; then
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.45.0/deploy/static/provider/cloud/deploy.yaml
elif test "${CTX}" = "minikube"; then
    minikube addons enable ingress
# AWS
elif test "${CTX}" = "aws"; then
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.45.0/deploy/static/provider/aws/deploy.yaml
# Bare-metal
else
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.45.0/deploy/static/provider/baremetal/deploy.yaml
fi

kubectl apply -f k8s-namespace.yaml
