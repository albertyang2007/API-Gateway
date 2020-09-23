This is a stock price exposure and analysic project, using wildfly and postgres, cassandra and deploy in k8s.

configMap for easystogu from application.properties:
kubectl create configmap easystogu-configmap --from-env-file=./application.properties
kubectl describe configmap easystogu-configmap

kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f client.yaml

