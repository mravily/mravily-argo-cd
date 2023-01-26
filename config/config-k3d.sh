k3d cluster create --config k3d-default.yaml

kubectl create namespace argocd

kubectl apply -k config/argoCD/install

kubectl apply -f config/argoCD/ing-argocd.yaml
