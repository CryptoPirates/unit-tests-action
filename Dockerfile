FROM gcr.io/kube-cluster-217003/golang-talib-rdkafka:latest

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
