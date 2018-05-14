FROM node:10.1.0-alpine

COPY docker-finish /usr/local/bin

EXPOSE 3000
EXPOSE 4200
EXPOSE 80

RUN npm install -g @angular/cli \
		   create-react-app 

RUN apk add --no-cache bash git vim \
 && rm -rf /var/cache/apk/*

CMD ["bash"]
