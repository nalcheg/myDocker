FROM docker:dind

RUN apk update \
    && apk add openssh-server \
    && mkdir /root/.ssh \
    && chmod 0700 /root/.ssh \
    && ssh-keygen -A

RUN sed -i s/root:!::0:::::/root:*::0:::::/ /etc/shadow

ARG AUTHORIZED_KEYS
RUN echo "${AUTHORIZED_KEYS}" > /root/.ssh/authorized_keys

#CMD ["/usr/sbin/sshd", "-D", "-e"]
