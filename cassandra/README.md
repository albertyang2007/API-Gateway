refer to tips:
https://blog.csdn.net/cuxiong8996/article/details/107155812
https://github.com/ideagw/multi-dc-c7a-k8s

This only use DC1, 3 cluster cassandra nodes

To build a cassandra image with password authentication:
refer to: https://hopding.com/cassandra-authentication-in-docker-container

docker build -t cassandra_authentication:3.11.9 .
docker tag cassandra_authentication:3.11.9 eyaweiw.cn:5000/cassandra_authentication:3.11.9
docker push eyaweiw.cn:5000/cassandra_authentication:3.11.9

when you can't terminate the pv and pvc, using below command:
kubectl patch pvc pvc_name -p '{"metadata":{"finalizers":null}}'
kubectl patch pv pv_name -p '{"metadata":{"finalizers":null}}'
kubectl patch pod pod_name -p '{"metadata":{"finalizers":null}}'

check status of the node tools:
kubectl exec -ti cassandra-0 -- nodetool status
kubectl exec -ti cassandra-0 -- /bin/bash

if the cassandra cluster status is not correct, pls check the docker logs k8s_cassandra_pod_id
for the issue of 'unable to gossip with any seeds', pls make sure the istio outbound traffic is allow any
cd /home/eyaweiw/istio/istio-1.7.4
istioctl install --set profile=demo --set meshConfig.outboundTrafficPolicy.mode=ALLOW_ANY

How to login cqlsh: (default password is password)
kubectl exec -ti cassandra-0 -- cqlsh -u cassandra -p cassandra

create keyspace in DC1 with 2 replication:
cqlsh> create keyspace EasyStoGu with replication ={'class' : 'NetworkTopologyStrategy', 'DC1':2};

if in both DC1 and DC2, then
cqlsh> create keyspace EasyStoGu with replication ={'class' : 'NetworkTopologyStrategy', 'DC1':2, 'DC2':2};

Use EasyStoGu;
then create your table now.

