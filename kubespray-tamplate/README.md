# vagrant-template
```
vagrant up
```


Check that the api server is actually running and hasn’t crashed:
```
docker ps | grep kube-apiserver
```
But the most likely problem and the one that usually gets me is that you don’t have a .kube directory with the right config in it. Try this:
```
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

# kubectl completion
```
source <(kubectl completion bash) # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
echo "source <(kubectl completion bash)" >> ~/.bashrc # add autocomplete permanently to your bash shell.
```
