[CmdletBinding()]
Param(
  [Parameter()] [Alias('u')] [string]$user,
  [Parameter()] [Alias('r')] [string]$repo
)

$usr = $env:username.toLower()
$dotfiles = "https://github.com/SupaStuff/dotfiles.git --branch dev"

if($user) {
	$usr = $user
	echo $user > ~\dockerfiles\tmp\username
}
else {
	echo "User name not provided. Using $usr. If you don't want this, use --user or -u."
}

if($repo) {
	$dotfiles = $repo
}
else {
	echo "Dotfiles repo not provided. Using $dotfiles. If you don't want this, use --repo or -r."
}

$uid=1111
if($docker_user) {
	$uid=$docker_user
}

$this_dir = $pwd.path
cd $PSScriptRoot

(Get-Content Dockerfile.tmpl).replace('#user', $usr).replace('#dotfiles', $dotfiles).replace('#uid', $uid) | Set-Content Dockerfile

docker build . -t $usr/home

rm Dockerfile

cd $this_dir
