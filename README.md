kubectl-docker-image
====================

This project is to build the docker image "hapkecom/kubectl-docker-image" to run kubectl, inclusive some tools like Bash, Netcat, IP Utils (incl. Ping), curl, vim.


How to use the Docker Image
===========================

* build Docker image:
  ```
  # OPTIONAL - NOT NEEED when docker image is build in CI:
  sudo docker build -t hapkecom/kubectl-docker-image:latest .
  ```
    

* set environment variable K8S_CONFIG to the base64 value of the Kubernetes config
  * as described e.g. .../kubernetes/README_kubernetes_for_gitlab-ci.md:

    ```
    export K8S_CONFIG=YXBpVmVyc...
    ```

* start the Docker container (alternatively in CI or in Kubernetes):
  ```
  sudo docker run -it -e K8S_CONFIG=$K8S_CONFIG hapkecom/kubectl-docker-image:latest /bin/bash
  ```

* run inside the Docker container (alternatively in CI or in Kubernetes):
  ```
  # first initialization:
  mkdir ~/.kube
  echo $K8S_CONFIG | base64 -d > ~/.kube/config
  ```
  and
  ```
  # then run scripts or kubectl directly
  kubectl get namespaces
  ```


