This is easystogu portal springboot docker k8s deployment.

configMap for easystogu from application.properties:
kubectl create configmap easystogu-configmap --from-env-file=./application.properties
kubectl describe configmap easystogu-configmap

kubectl apply -f deployment.yaml

to see the server log for pod:
kubectl exec -i -t easystogu-portal-6d66556fc4-h6hqn -- tail -200 /serverlog/server.log


kubectl apply -f service-nodeport.yml 
kubectl apply -f service-loadbalancer.yml 
kubectl apply -f service-cluster.yml

[root@k8sMaster easystogu]# kubectl get svc | grep easy
easystogu-cluster                      ClusterIP      10.10.58.134    <none>           8080/TCP                     4m14s
easystogu-loadbalancer                 LoadBalancer   10.10.131.108   192.168.56.190   8080:30004/TCP               5m1s
easystogu-nodeport                     NodePort       10.10.188.82    <none>           8080:30003/TCP               5m8s

Using loadbalancer to access portal:
curl -i -X GET http://loadbalance_ip:8080/portal/home/

curl -i -X GET http://192.168.56.103:8080/portal/home/FastDailyOverAllRunner

To check the log:
ke easystogu-portal-v2-8d8b68bc8-fn6qr -- tail -f /serverlog/server.log
