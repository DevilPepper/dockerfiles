docker run -it --rm --name webdev --hostname webdev -v code:/home/stuff/code -p 8080:80 -p 3000:3000 -p 4200:4200 $args stuff/webdev bash
