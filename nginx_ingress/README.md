This is to install nginx ingress in k8s cluster.
refer to: https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-manifests/

install the Ingress Controller:
$ kubectl apply -f common/ns-and-sa.yaml

$ kubectl apply -f rbac/rbac.yaml

$ kubectl apply -f rbac/ap-rbac.yaml

$ kubectl apply -f common/default-server-secret.yaml

$ kubectl apply -f common/nginx-config.yaml

$ kubectl apply -f common/vs-definition.yaml
$ kubectl apply -f common/vsr-definition.yaml
$ kubectl apply -f common/ts-definition.yaml
$ kubectl apply -f common/policy-definition.yaml

$ kubectl apply -f common/gc-definition.yaml

$ kubectl apply -f common/global-configuration.yaml

$ kubectl apply -f common/ap-logconf-definition.yaml

$ kubectl apply -f common/ap-policy-definition.yaml

$ kubectl apply -f deployment/nginx-ingress.yaml

use loadbalancer to assess or use nodeport to access nginx ingress controller
$ kubectl apply -f service/loadbalancer.yaml

or $ kubectl create -f service/nodeport.yaml

uninstall the Ingress Controller:
$ kubectl delete namespace nginx-ingress

$ kubectl delete clusterrole nginx-ingress
$ kubectl delete clusterrolebinding nginx-ingress
