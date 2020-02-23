FROM node:buster-slim

ENV USER_ID=1000
ENV GROUP_ID=1000

RUN mkdir -p /home/developer && \
    echo "developer:x:${USER_ID}:${GROUP_ID}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${USER_ID}:" >> /etc/group && \
    chown ${USER_ID}:${GROUP_ID} -R /home/developer

USER developer
ENV HOME /home/developer

ENTRYPOINT /bin/bash
