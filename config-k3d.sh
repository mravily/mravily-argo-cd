export IP=`ifconfig en0 | grep inet | grep -v inet6 | awk '{print $2}'`

k3d cluster create --config config/k3d-default.yaml

kubectl create namespace argocd

kubectl apply -k config/base

kubectl wait deploy/argocd-server -n argocd --for condition=available --timeout=600s

kubectl apply -n argocd -f config/application.yaml

# kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d