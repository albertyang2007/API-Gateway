This is a stock price exposure and analysic project, using wildfly and postgres, cassandra and deploy in k8s.

configMap for easystogu from application.properties:
kubectl create configmap easystogu-configmap --from-env-file=./application.properties
kubectl describe configmap easystogu-configmap

kubectl apply -f deployment.yaml

to see the server log for pod:
kubectl exec -i -t easystogu-wildjboss-deployment-564bb66cff-5gp7p -- /bin/bash

kubectl apply -f service-nodeport.yml 
kubectl apply -f service-loadbalancer.yml 
kubectl apply -f service-cluster.yml

[root@k8sMaster easystogu]# kubectl get svc | grep easy
easystogu-cluster                      ClusterIP      10.10.58.134    <none>           8080/TCP                     4m14s
easystogu-loadbalancer                 LoadBalancer   10.10.131.108   192.168.56.190   8080:30004/TCP               5m1s
easystogu-nodeport                     NodePort       10.10.188.82    <none>           8080:30003/TCP               5m8s

login the k8snode and access the easystogu web page:
curl -i -X GET http://10.10.188.82:8080/portal/home/

issue: still not known how to access loadbalancer to access the easystogu. 
