#!/bin/bash
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

kubectl delete configmap config -n $NAMESPACE
kubectl delete secret prod-secrets -n $NAMESPACE
kubectl delete -f k8s-values.yaml -n $NAMESPACE
kubectl delete -f k8s-extends.yaml -n $NAMESPACE
kubectl delete -f k8s-ingress.yaml -n $NAMESPACE
kubectl delete -f k8s-namespace.yaml