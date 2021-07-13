#!/bin/bash
BLUE='\033[0;34m'
NC='\033[0m' # No Color
PS3="Select a namespace: "
options=("development" "test" "production")
select opt in "${options[@]}"; do
    NAMESPACE=$opt
    if [ 1 -le "$REPLY" ] && [ "$REPLY" -le 3 ]; then
        echo $NAMESPACE
        break
    else
        echo "out of range"
        continue
    fi
done

kubectl create configmap config --from-file=config.production.js -n $NAMESPACE
kubectl create secret generic prod-secrets --from-env-file=.env -n $NAMESPACE
kubectl apply -f k8s-values.yaml -n $NAMESPACE
kubectl apply -f k8s-extends.yaml -n $NAMESPACE
kubectl apply -f k8s-ingress.yaml -n $NAMESPACE
