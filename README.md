# Node Label Controller

## Idea
Have a controller which watches the Kubernetes nodes and sets a label(`kubermatic.io/uses-container-linux: 'true'`) to the Kubernetes Node object
when the node uses ContainerLinux as operating system.

## Usage

Create the `label-controller` deployment.

```
kubectl apply -f deploy -R
```

