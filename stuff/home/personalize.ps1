if([System.IO.File]::Exists("$pwd\.username")){
	$user = Get-Content .username -First 1
}
else{
	$user = $env:username.toLower()
}

if($args.length -eq 0){
	echo "USAGE: .\personalize.ps1 BASE_IMAGE [USER_NAME]"
	echo "If user is not provided, the script will attempt to copy from the image $user/home. If it doesn't exist, run generate.ps1"
}
else{
	$base_image = $args[0]
	$new_image = $base_image.split('/')[-1]
	$new_image = "$user/$new_image"

	if($args.length -eq 2){
		$user = $args[2]
	}

	(Get-Content Dockerfile.copy).replace('#user', $user).replace('#base_image', $base_image) | Set-Content Dockerfile
	docker build . -t $new_image
	rm Dockerfile
}
