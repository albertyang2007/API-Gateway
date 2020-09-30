A simple postgres k8s deployment for easystogu project.

k8s deploy steps:
kubectl apply -f postgres-storage.yml
kubectl apply -f postgres-configmap.yml
kubectl apply -f postgres-deployment.yml
kubectl apply -f postgres-service-cluster.yml
kubectl apply -f postgres-service-nodeport.yml

to find the pod id:
[root@k8smaster postgres_simple]# kubectl get pod | grep postgres
NAME                        READY   STATUS    RESTARTS   AGE
postgres-765f5cdff4-6qx2v   1/1     Running   0          24m

login the pod:
kubectl exec -i -t postgres-765f5cdff4-6qx2v -- /bin/bash


login postgres:
psql -h localhost -U postgres --password -p 5432 postgres

to find the service and port:
[root@k8smaster postgres_simple]# kubectl get svc |grep postgres
NAME                TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
kubernetes          ClusterIP   10.96.0.1       <none>        443/TCP          22h
postgres-cluster    ClusterIP   10.103.218.88   <none>        5432/TCP         36m
postgres-nodeport   NodePort    10.96.119.28    <none>        5432:30001/TCP   31m

find which k8snode that the pod is run in:
kubectl describe pod postgres-765f5cdff4-6qx2v

login the k8snode and find the docker container ID:
[root@k8snode1 ~]# docker ps -a | grep postgres
CONTAINER ID  IMAGE           COMMAND                  CREATED       STATUS         PORTS               NAMES
5822cb9a42a4  d38331307292   "docker-entrypoint.s…"  26 minutes ago  Up 26 minutes  k8s_postgres_postgres-7fdd4d6747-46hbn_default_ce91c1f9-f504-4283-b2f3-e2de29c1e0ed_0

login the docker directly:
#docker exec -it 5822cb9a42a4 /bin/bash
login the postgres:
#psql -U postgresadmin --password postgres

another way to login the postgres in k8snode thru the nodeport IP:
login k8snode first:
#psql -h 10.96.119.28 -U postgres --password -p 5432 postgres

or use nodeport mapping to login postgres in k8snode:
#psql -h localhost -U postgresn --password -p 30001 postgres



