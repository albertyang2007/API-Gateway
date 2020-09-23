The k8s network plugin.

apply the flannel plugin:
kubectl apply -f flannel/kube-flannel.yml

to test the k8s dns: 
(refer to https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/)
kubectl apply -f dnsutils.yaml


