$user = $(. $PSScriptRoot\docker-user.ps1)
$DISPLAY = $((Get-NetIPConfiguration | Where-Object { $_.IPv4DefaultGateway -ne $null -and $_.NetAdapter.Status -ne "Disconnected" }).IPv4Address.IPAddress)
$DISPLAY += ":0.0"

docker run -it --rm `
	--name webdev-atom `
	--hostname webdev-atom `
	-e DISPLAY=$DISPLAY `
	-v code:/home/$user/code `
	-p 8080:80 `
	-p 3000:3000 `
	-p 4200:4200 `
	$args $user/webdev:atom
