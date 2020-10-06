refer to tips:
https://blog.csdn.net/cuxiong8996/article/details/107155812
https://github.com/ideagw/multi-dc-c7a-k8s

This only use DC1, 3 cluster cassandra nodes

when you can't terminate the pv and pvc, using below command:
kubectl patch pvc pvc_name -p '{"metadata":{"finalizers":null}}'
kubectl patch pv pv_name -p '{"metadata":{"finalizers":null}}'
kubectl patch pod pod_name -p '{"metadata":{"finalizers":null}}'

check status of the node tools:
kubectl exec -ti cassandra-0 -- nodetool status
kubectl exec -ti cassandra-0 -- /bin/bash

How to login cqlsh:
kubectl exec -ti cassandra-0 -- cqlsh

create keyspace in DC1 with 2 replication:
cqlsh> create keyspace EasyStoGu with replication ={'class' : 'NetworkTopologyStrategy', 'DC1':2};

if in both DC1 and DC2, then
cqlsh> create keyspace EasyStoGu with replication ={'class' : 'NetworkTopologyStrategy', 'DC1':2, 'DC2':2};

then create your table now.
