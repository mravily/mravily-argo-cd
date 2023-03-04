# export IP=`ifconfig en0 | grep inet | grep -v inet6 | awk '{print $2}'`

k3d cluster create --config argo-cd/config/k3d-default.yaml

cp -R /root/.kube /home/vagrant

sudo chown -R vagrant:vagrant /home/vagrant/.kube

kubectl create namespace argocd

kubectl apply -k argo-cd/config/base

kubectl wait deploy/argocd-server -n argocd --for condition=available --timeout=120s

kubectl apply -n argocd -f argo-cd/config/application.yaml

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d ; echo

kubectl port-forward --address 0.0.0.0 svc/argocd-server -n argocd 8080:443