$user = $(. $PSScriptRoot\docker-user.ps1)

docker run -it --rm `
	--name webdev `
	--hostname webdev `
	-v code:/home/$user/code `
	-p 8080:80 `
	-p 3000:3000 `
	-p 4200:4200 `
	$args $user/webdev
