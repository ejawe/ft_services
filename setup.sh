

#############################################
minikube delete
#docker stop $(docker ps -a -q)
#docker rm $(docker ps -a -q)
#############################################
#echo "$USER" | sudo -S chmod 666 /var/run/docker.sock
#avoir les permissions sur docker sans sudo
#sudo usermod -aG docker $USER && newgrp docker


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
minikube addons enable metrics-server
minikube addons enable logviewer
minikube addons enable dashboard
minikube addons enable metrics-server



docker build -t nginx srcs/nginx/
docker build -t mysql srcs/mysql/
docker build -t wordpress srcs/wordpress/
docker build -t phpmyadmin srcs/phpmyadmin/

#docker build -t influxdb srcs/influxdb/
##docker build -t telegraf srcs/telegraf/
#docker build -t grafana srcs/grafana/
#docker build -t ftps srcs/ftps/

#docker run -v /sys/fs/cgroup your_image




kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/mysql/mysql.yaml
sleep 1
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

#kubectl apply -f srcs/telegraf/telegraf.yaml
#kubectl apply -f srcs/grafana/grafana.yaml
#kubectl apply -f srcs/influxdb/influxdb.yaml
#kubectl apply -f srcs/ftps/ftps.yaml
#to creata de grafana.db file
#kubectl cp <grafana_pod>:grafana/data/grafana.db /home/ejawe/Documents/42/ft_services/srcs/grafana/grafana.db

sleep 5
kubectl get all
