The k8s network plugin.

apply the flannel plugin when install the k8s:
kubectl apply -f flannel/kube-flannel.yml

to test the k8s dns: 
(refer to https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/)
kubectl apply -f dnsutils.yaml

simple command to check the dns:
kubectl exec -i -t dnsutils -- nslookup kubernetes.default

the normal output is like:
Server:    10.0.0.10
Address 1: 10.0.0.10

Name:      kubernetes.default
Address 1: 10.0.0.1


An every good example for how to use the k8s network policy:
https://github.com/ahmetb/kubernetes-network-policy-recipes