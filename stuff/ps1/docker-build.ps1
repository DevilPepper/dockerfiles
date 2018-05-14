$repo_builder = $pwd.path.split("\")[-3..-1]

if($repo_builder[0] -eq "dockerfiles") {
	$repo = "supastuff/{0}:{1}" -f $repo_builder[1], $repo_builder[2]
}
elseif($repo_builder[1] -eq "dockerfiles") {	
	$repo = "supastuff/{0}" -f $repo_builder[2]
}
else {
	echo "this isn't one of your normal dockerfiles"
	echo $repo_builder
}

if($args.length -ne 0) {
	$repo = $repo.split(":")[0]
	$repo += ":{0}" -f $args[0]
}

if($repo){
	echo $repo
	cp ../docker-finish . -EA SilentlyContinue
	docker build -t $repo .
	rm docker-finish -EA SilentlyContinue
}
