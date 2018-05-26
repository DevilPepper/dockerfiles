$user = $(. $PSScriptRoot\docker-user.ps1)

if($args.length -eq 0){
	echo "USAGE: .\personalize.ps1 BASE_IMAGE [USER_NAME]"
	echo "If user is not provided, this script will attempt to copy from the image $user/home"
	echo "If the image doesn't exist, run $(Resolve-Path $PSScriptRoot\..\home)\generate.ps1"
}
else{
	$base_image = $args[0]
	$new_image = $base_image.split('/')[-1]
	$new_image = "$user/$new_image"

	if($args.length -eq 2){
		$user = $args[2]
	}

	$this_dir = $pwd.path

	cd $PSScriptRoot\..\templates
	(Get-Content personalize.tmpl).replace('#user', $user).replace('#base_image', $base_image) | Set-Content Dockerfile
	docker build . -t $new_image
	rm Dockerfile

	cd $this_dir
}
