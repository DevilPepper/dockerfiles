$DISPLAY = $((Get-NetIPConfiguration | Where-Object { $_.IPv4DefaultGateway -ne $null -and $_.NetAdapter.Status -ne "Disconnected" }).IPv4Address.IPAddress)
$DISPLAY += ":0.0"

if($args.length -eq 0) {
	echo "Usage: docker-run-gui.ps1 IMAGE_NAME [extra docker run args]"
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
		-e DISPLAY=$DISPLAY `
		-v code:/home/$user/code `
		-p 8080:80 `
		-p 3000:3000 `
		-p 4200:4200 `
		$argz $args[0]
}
