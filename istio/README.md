How to install istio:

go to https://github.com/istio/istio/releases and download the istio 1.7.4 version

unzip it and move the ctl to:
sudo istioctl /usr/local/bin

I had modify the docker hub to my eyaweiw.cn:5000 for all charts configuration, pls check the yaml files under charts

refer to tips:
https://www.jianshu.com/p/973147d3f2b5
https://istio.io/latest/docs/setup/getting-started/#download

1. Apply a default Istio installation
istioctl install 
or specify the profile:
istioctl install --set profile=demo

Detected that your cluster does not support third party JWT authentication. Falling back to less secure first party JWT. See https://istio.io/docs/ops/best-practices/security/#configure-third-party-service-account-tokens for details.
Istio core installed                                                                                                              
Istiod installed                                                                                                                  
Egress gateways installed                                                                                                         
Ingress gateways installed                                                                                                        
Installation complete    

install operator:
istioctl operator init

to enable the istio auto inject envoy for namespace:
kubectl label namespace default istio-injection=enabled
kubectl label namespace eyaweiw istio-injection=enabled

2.check  Istio
kubectl get crd|grep istio
kubectl get all -n istio-operator
kubectl get IstioOperator -n istio-system -o yaml
kubectl get all -n istio-system


3. delete istio
istioctl manifest generate --set profile=demo > generated-manifest.yaml
istioctl manifest generate --set profile=demo |kubectl delete -f -
kubectl get all -n istio-system | grep istio
kubectl delete ns istio-system


===========================install the bookinfo example istio demo===========================
download istio 1.7.4 and install:
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.7.4 TARGET_ARCH=x86_64 sh - 
cd istio-1.7.4
istioctl install --set profile=demo

alow namespace to the istio to auto inject envoy:
kubectl label namespace default istio-injection=enabled

install the istio bookinfo example project:
kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml

check the kubectl:
kubectl get services
kubectl get pods

test the bookinfo productpage:
kubectl exec "$(kubectl get pod -l app=ratings -o jsonpath='{.items[0].metadata.name}')" -c ratings -- curl -s productpage:9080/productpage | grep -o "<title>.*</title>"
<title>Simple Bookstore App</title>

install the ingress gateway:
kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml

get the bookinfo pod info:
kubectl describe pod istio-ingressgateway-bd4fdbd5f-gbjfl -n istio-system

istio health check:
istioctl analyze

get the ingress gate svc info:
kubectl get svc istio-ingressgateway -n istio-system
kubectl describe svc istio-ingressgateway -n istio-system | grep NodePort | grep http2

get the ingress port:
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}')
export INGRESS_HOST=$(kubectl get po -l istio=ingressgateway -n istio-system -o jsonpath='{.items[0].status.hostIP}')
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
echo "$GATEWAY_URL"
echo "http://$GATEWAY_URL/productpage"

the example output is like:
http://192.168.56.203:31349/productpage

here the INGRESS_HOST is the k8snode3 IP address, and port is got from ingress gateway service.


