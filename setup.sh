#avoir les permissions sur docker sans sudo
sudo usermod -aG docker $USER && newgrp docker

#############################################
minikube delete
#docker stop $(docker ps -a -q)
#docker rm $(docker ps -a -q)
#############################################


minikube start --vm-driver=docker #Spécification du pilote de machine virtuelle
sudo chown -R $USER $HOME/.kube $HOME/.minikube
eval $(minikube docker-env) #point the docker client to the machine's docker daemon



#metalLb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb/metallb_config.yaml



#minikube addons list
docker build -t nginx srcs/nginx/
docker build -t mysql srcs/mysql/
docker build -t wordpress srcs/wordpress/

#docker run -v /sys/fs/cgroup your_image




kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/mysql/mysql.yaml
sleep 1
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

kubectl get all
