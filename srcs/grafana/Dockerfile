FROM alpine

RUN apk update ;\ 
    apk add --no-cache wget libc6-compat;\
    wget https://dl.grafana.com/oss/release/grafana-7.1.5.linux-amd64.tar.gz -P /tmp;\
    tar -zxvf /tmp/grafana-7.1.5.linux-amd64.tar.gz -C /root;\
    rm -f /tmp/grafana-7.1.5.linux-amd64.tar.gz;\
    mv /root/grafana-7.1.5 /root/grafana

RUN ln -s /root/grafana/bin/grafana-cli /usr/bin;\
    ln -s /root/grafana/bin/grafana-server /usr/bin;

RUN mkdir -p /var/lib/grafana/dashboards

ADD ./srcs/dashboard.json /var/lib/grafana/dashboards
ADD ./srcs/dashboard.yaml /root/grafana/conf/provisioning/dashboards
ADD ./srcs/datasources.yaml /root/grafana/conf/provisioning/datasources
ADD ./srcs/start.sh /tmp

EXPOSE 3000
CMD ["/bin/ash", "/tmp/start.sh"]