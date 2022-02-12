# Jenkins
The aim of this project is to build a container running [Jenkins](https://github.com/jenkinsci/jenkins).

I decided to create this project because I couldn't find a container image for my raspberry pi.

With the content of this folder, anyone can create a jenkins container for the platform of it's chosing, as long as the platform is supported by [Alpine](https://www.alpinelinux.org/) and  [OpenJDK 11](https://openjdk.java.net/projects/jdk/11/).

# How to build and run the image 

## Using `podman` 

1. Download the jenkins war file of the version you would like to use. 
    
    If the latest version is needed, just launch the `download_latest.sh` file.

2. Build the image usign the `Dockerfile`:

        podman build . --tag jenkins

3. Start the container
    
    The first time:

        podman run -d -p 8080:8080 --name jenkins jenkins

    All subsequence times:

        podman run -d jenkins

4. Get the generated admin password

        podman exec jenkins cat /var/lib/jenkins/secrets/initialAdminPassword
    
5. Browse at http://localhost:8080  

6. Stop the container

        podman stop jenkins

## **Podman notes**
To bind the containers on a ***port lower `1024`*** you need to run the previous command as root.

## Using `docker`
If you prefer to use docker, simply substitute `podman` with `docker`.

Unlike podman, docker always runs as root and can bind any container to any port.

## Using `podman-compose`

1. Build all the necessary images

        podman-compose -p pod-jenkins build

2. Build the infrastructure and start all the containers
    
    **NOTE**: Unlike with docker-compose, all container are inside the same pod and cannot listen on the same port.

        podman-compose -p pod-jenkins up -d

3. Stop all the container and dismantle the infrastructure

        podman-compose -p pod-jenkins down

## Using `docker-compose`
Just replace `podman-compose` with `docker-compose`.

**NOTE**: unlike `docker-compose` all container are place in a virtual network and can listen on the same port.

# Notes
It's possible to find additional Jenkins installation configuaration [here](https://www.jenkins.io/doc/book/installing/initial-settings/).

# Uploading to a container registry

## Using `podman` 

1. Download the jenkins war file of the version you would like to use. 
    
    If the latest version is needed, just launch the `download_latest.sh` file.

2. Build the image usign the `Dockerfile`:

        podman build . -f Dockerfile --tag <username>/jenkins:<tagname>

3. Login to your account

        podman login <registry>

    For example

        podman login index.docker.io

4. Push the image

        podman push <username>/jenkins:<tagname>

## Using `docker`
If you prefer to use docker, simply substitute `podman` with `docker`.

# Moving to K8s

## Using `podman-compose`
[podman-compose](https://github.com/containers/podman-compose) is a great projects that turn your [docker-compose.yaml](https://docs.docker.com/compose/compose-file/) into a pod ready to be used on k8s.

    podman-compose -p pod-jenkins up -d --build 

Once you created a pod in podman, you can generate a kubernetes config file

    podman generate kube -s pod-jenkins > podman-k8s/kube-jenkins.yaml

Rembember to take down the podman-compose pod

    podman-compose -p pod-jenkins down


## Using `kompose`
[Kompose](https://github.com/kubernetes/kompose) is a great tool to turn your [docker-compose.yaml](https://docs.docker.com/compose/compose-file/) into a kubernetes configuration.

    kompose convert -o kompose/ 

## Testing the K8s config corectness
To test the generate config file, use [kubeval](https://www.kubeval.com).

***`podman-compose`***

    kubeval podman-k8s/kube-jenkins.yaml

***`kompose`***

    kubeval kompose/jenkins-deployment.yaml
    kubeval kompose/jenkins-service.yaml

# K8s testing
There are serveral way to test the kubernetes configurations

## K8s 
There are several project aimed to deploy lightweight k8s such as: [minikube](https://minikube.sigs.k8s.io/docs/), [minishif](https://www.okd.io/minishift/) or [k3s](https://k3s.io/).

To apply to k8s the configuration:

    kubectl apply -f <kubernetes config>

## `podman play`
Podman offers to run some of the kubernetes configurations via `podman play` tool:

    podman play kube <kubernetes config>

# Automating builds with Jenkins
Jenkins is a great tool to automate many things, including builds.

In this project, you'll find a `Jenkinsfile` that can be used to automate the container bulding process.

## ***Remember to setup***:

1. The container registry credentials as `container-registry`

2. Install the Jenkins plugins: [Docker](https://plugins.jenkins.io/docker-plugin/) and [Docker Pipeline](https://plugins.jenkins.io/docker-workflow/)

3. On the node in charge of the build:
    
    1. Setup the variable `PROCESS_ARCHITECTURE`

    2. Install the packager `curl`, `wget` & `docker`

## Note 
When using Jenkins, Docker is a better alternative than podman because there is a better integration

License
-------

Pending

Author Information
------------------

If you like my work and want to know more, visit my website:
[www.mattiarubini.com](https://www.mattiarubini.com)
