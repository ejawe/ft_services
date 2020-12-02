kubectl delete service phpmyadmin-service
kubectl delete service wordpress
kubectl delete service wordpress-mysql
kubectl delete deployment phpmyadmin-deployment
kubectl delete deployment wordpress-mysql
kubectl delete deployment wordpress
kubectl delete pvc mysql-pv-claim
kubectl delete pvc wp-pv-claim

kubectl delete service nginx
kubectl delete deployment nginx
#kubectl delete configmap nginx-conf

kubectl delete service grafana
kubectl delete service influxdb
kubectl delete service telegraf
kubectl delete deployment grafana-deployment
kubectl delete deployment influxdb-deployment
kubectl delete deployment telegraf-deployment
kubectl delete pvc influxdb-pv-claim
#kubectl delete secret telegraf-token-l6nxw
kubectl delete serviceaccount telegraf