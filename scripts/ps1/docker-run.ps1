$user = $(. $PSScriptRoot\docker-user.ps1)

if($args.length -eq 0) {
	echo "Usage: docker-run.ps1 IMAGE_NAME [extra docker run args]"
}
else {
	$argz = @()
	if($args.length -gt 1) {
		$argz = $args[1..-1]
	}

	$img = $args[0].split("/")[-1].replace(":", "-")

	docker run -it --rm `
		--name $img `
		--hostname $img `
		-e TZ=$TZ `
		-v code:/home/$user/code `
		-v dotfiles:/home/$user/dotfiles `
		-p 8080:80 `
		-p 3000:3000 `
		-p 4200:4200 `
		$argz $args[0]
}
