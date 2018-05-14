FROM node:10.1.0-slim

COPY docker-finish /usr/local/bin

EXPOSE 3000
EXPOSE 4200
EXPOSE 80

RUN npm install -g @angular/cli \
                   create-react-app

RUN apt-get update && apt-get install -y --no-install-recommends \
								git \
								vim \
 && rm -rf /var/lib/apt/lists/* /tmp/*.deb

CMD ["bash"]
