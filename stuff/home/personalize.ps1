$user = $env:username.toLower()

if($args.length -lt 2){
	echo "USAGE: .\personalize.ps1 BASE_IMAGE NEW_IMAGE [USER_NAME]"
	echo "If user is not provided, the script will attempt to copy from the image $user/home. If it doesn't exist, run generate.ps1"
}
else{
	$base_image = $args[0]
	$new_image = $args[1]

	if($args.length -eq 3){
		$user = $args[2]
	}

	(Get-Content Dockerfile.copy).replace('#user', $user).replace('#base_image', $base_image) | Set-Content Dockerfile
	docker build . -t $new_image
	rm Dockerfile
}
