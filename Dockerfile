FROM ubuntu:16.04
#ADD argo /usr/local/bin/argo
ADD https://github.com/argoproj/argo/releases/download/v2.0.0-alpha3/argo-linux-amd64 /usr/local/bin/argo
ADD .kube /home/argo/.kube
ADD entrypoint.sh /usr/bin/entrypoint.sh
ENV HOME=/home/argo

RUN chmod +x /usr/local/bin/argo \
    && adduser --uid 1000 --home /config --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password -q argo \
    && chown argo:argo /home/argo/.kube/config \
    && chmod +x /usr/bin/entrypoint.sh
USER argo
ENTRYPOINT ["/usr//bin/entrypoint.sh"]
