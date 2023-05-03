# nginx-plus-ic

```
**Disclaimer**

This lab reproduction project is intended for educational and testing purposes only, and is not suitable for production environments. It is designed to help users experiment with and learn about specific software technologies and tools.

This project has been tested with Kubernetes version 1.25.4 and NGINX Ingress Controller 3.0.0, and may not be compatible with other versions of these tools. Users should test the project on their own environment and version of the tools before using it.

Please be aware that this project is a work in progress, and may have known issues, missing features, or experimental components. We cannot guarantee that it will work perfectly or meet your specific needs.

By using this project, you acknowledge that you do so at your own risk. The author(s) of this project make no warranty or guarantee of any kind, and are not responsible for any loss or damage resulting from the use of this project.

```

Deploy and test an NGINX Plus Ingress Controller in one go!

Open up your terminal application.
Type the following command and press Enter:
```
git clone https://github.com/ericausente/nginx-plus-ic.git
```

Once the cloning process is complete, type the following command and press Enter. 
This will change your current working directory to the newly cloned repository.
```
cd nginx-plus-ic
```
You should now be in the nginx-plus-ic directory and ready to start working with it. Run the script: 
```
bash script.sh
```

This Configures RBAC, Creates Common Resources and Custom Resources 
And it will ask you for a JWT token obtained from NGINX in order for your to Deploy the Ingress Controller

We are using the NGINX IC Plus JWT token in a Docker Config Secret. 
This script does it for us wherein it will create a docker-registry secret on the cluster using the JWT token as the username (secret is named as "regcred" and it was added to the NGINX Plus IC deployment spec). 


Make sure that the nginx-ingress pod is up and running by executing the below: 
```
kubectl get pods -n nginx-ingress
```


In order to get access to the Ingress Controller, A NodePort Service was also created for the Ingress Controller Pods. 
Here are the port bindings: 

```
  - port: 80
    nodePort: 30080
    targetPort: 80
    protocol: TCP
    name: http
  - port: 8081
    nodePort: 30081
    targetPort: 8081
    protocol: TCP
    name: health
  - port: 443
    nodePort: 30443
    targetPort: 443
    protocol: TCP
    name: https
```

# Test the IC 
This is done by running the below script which applies a yaml file from an Example in nginxinc repository. In this example we configure load balancing with TLS termination for a simple web application using the VirtualServer resource. The application, called cafe, lets you get either tea via the tea service or coffee via the coffee service. You indicate your drink preference with the URI of your HTTP request: URIs ending with /tea get you tea and URIs ending with /coffee get you coffee.

```
bash test.sh
```

Once you are done and want to clean all the resources, run the below script that will delete all the NGINX Plus resources as well as the secret resource that we created. 

```
bash clean.sh
```


