How to install istio:

go to https://github.com/istio/istio/releases and download the istio 1.7.4 version

unzip it and move the ctl to:
sudo istioctl /usr/local/bin

I had modify the docker hub to my eyaweiw.cn:5000 for all charts configuration, pls check the yaml files under charts

refer to tips:
https://www.jianshu.com/p/973147d3f2b5

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


2.check  Istio
kubectl get crd|grep istio
kubectl get all -n istio-operator
kubectl get IstioOperator -n istio-system -o yaml
kubectl get all -n istio-system


3. delete istio
istioctl manifest generate <your original installation options> | kubectl delete -f -
kubectl delete ns istio-system
 
