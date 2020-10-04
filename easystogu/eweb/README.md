This is easystogu eweb wildfly docker k8s deployment.

kubectl apply -f deployment.yaml

to see the server log for pod:
kubectl exec -i -t easystogu-eweb-564bb66cff-5gp7p -- /bin/bash

and than 
curl -i -X GET http://127.0.0.1:8080/eweb/index.htm

kubectl apply -f service-nodeport.yml 
kubectl apply -f service-loadbalancer.yml 
kubectl apply -f service-cluster.yml

[root@k8sMaster easystogu]# kubectl get svc | grep easy
easystogu-cluster                      ClusterIP      10.10.58.134    <none>           8080/TCP                     4m14s
easystogu-loadbalancer                 LoadBalancer   10.10.131.108   192.168.56.190   8080:30004/TCP               5m1s
easystogu-nodeport                     NodePort       10.10.188.82    <none>           8080:30003/TCP               5m8s

login the k8snode and access the easystogu web page:
curl -i -X GET http://10.10.188.82:8080/eweb/index.htm

issue: still not known how to access loadbalancer to access the easystogu. 
