FROM node:8.9-alpine

RUN npm install -g @angular/cli \
		   create-react-app

RUN apk add --no-cache bash git vim

EXPOSE 3000
EXPOSE 4200
EXPOSE 80

COPY docker-finish /usr/local/bin

CMD ["bash"]
