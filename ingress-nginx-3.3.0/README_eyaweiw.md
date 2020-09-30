refer to https://kubernetes.github.io/ingress-nginx/deploy/

# helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx/

# helm fetch ingress-nginx/ingress-nginx

extract the package
# tar -zxvf ingress-nginx-3.3.0.tgz

modify all image name to local docker image in values.yaml

helm install ./ingress-nginx-3.3.0/ --name ingress-nginx


An example Ingress that makes use of the controller:

  apiVersion: networking.k8s.io/v1beta1
  kind: Ingress
  metadata:
    annotations:
      kubernetes.io/ingress.class: nginx
    name: example
    namespace: foo
  spec:
    rules:
      - host: www.example.com
        http:
          paths:
            - backend:
                serviceName: exampleService
                servicePort: 80
              path: /
    # This section is only required if TLS is to be enabled for the Ingress
    tls:
        - hosts:
            - www.example.com
          secretName: example-tls

If TLS is enabled for the Ingress, a Secret containing the certificate and key must also be provided:

  apiVersion: v1
  kind: Secret
  metadata:
    name: example-tls
    namespace: foo
  data:
    tls.crt: <base64 encoded cert>
    tls.key: <base64 encoded key>
  type: kubernetes.io/tls

