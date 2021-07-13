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

for deployment in $(kubectl get deployment -n ${NAMESPACE} -o=jsonpath='{.items[*].metadata.name}'); do
    kubectl scale deploy $deployment -n $NAMESPACE --replicas=0 # -n $NAMESPACE
done

kubectl delete configmap config -n $NAMESPACE
kubectl delete secret prod-secrets -n $NAMESPACE