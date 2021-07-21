from hashicorp/packer:1.7.4 as build

ARG USERNAME=packer

RUN apk add --no-cache \
            ansible \
            su-exec \
 && adduser -D $USERNAME -s /bin/bash

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]


FROM build as test

RUN set -ex
RUN id -u $USERNAME
RUN test -d /home/$USERNAME
RUN packer --version
RUN ansible --version
