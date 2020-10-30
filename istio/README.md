How to install istio:

go to https://github.com/istio/istio/releases and download the istio 1.7.4 version

unzip it and move the ctl to:
sudo istioctl /usr/local/bin

then refer to https://blog.csdn.net/shuai_wy/article/details/109360590
or https://www.jianshu.com/p/973147d3f2b5

1. install istio:
istioctl install 

Detected that your cluster does not support third party JWT authentication. Falling back to less secure first party JWT. See https://istio.io/docs/ops/best-practices/security/#configure-third-party-service-account-tokens for details.
Istio core installed                                                                                                              
Istiod installed                                                                                                                  
Egress gateways installed                                                                                                         
Ingress gateways installed                                                                                                        
Installation complete    

install operator:
istioctl operator init

2. kubectl install Istio
 
