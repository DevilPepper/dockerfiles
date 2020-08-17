from hashicorp/packer:1.6.1

ARG USERNAME=packer

RUN apk add --no-cache \
            ansible \
            su-exec \
 && adduser -D $USERNAME -s /bin/bash

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
