targetConfig="/etc/k8s/config"
sourceConfig="$(pwd)/k8s/config/"

if [ -e "$targetConfig" ]; then
    rm -rf "$targetConfig"
fi
cp -R "$sourceConfig" "$targetConfig"
echo "$sourceConfig successfully copied to $targetConfig"

kubectl apply -f ./k8s/base/configmap
kubectl apply -f ./k8s/base/service
kubectl apply -f ./k8s/base/persistentvolume
kubectl apply -f ./k8s/base/persistentvolumeclaim
kubectl apply -f ./k8s/base/statefulset
kubectl apply -f ./k8s/base/deployment
kubectl apply -f ./k8s/base/issuer
kubectl apply -f ./k8s/base/ingress