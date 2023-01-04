# k3d cluster create --config ./IoT/k3d-default.yaml
k3d cluster create --config k3d-default.yaml

kubectl apply -k config/install

kubectl apply -n argocd -f config/application.yml

# kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# kubectl config set-context --current --namespace=argocd

# curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64

# sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd

# rm argocd-linux-amd64

# kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "ClusterIP"}}'

# argocd login --core

# argocd app create k3d --repo https://github.com/mravily/mravily-argo-cd.git --path manifests --dest-server https://kubernetes.default.svc --dest-namespace dev

# sed -i 's/mravily\/parrot\:v1/mravily\/parrot\:v2/g' /src/IoT/manifests/deploy.yaml