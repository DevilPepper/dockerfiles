if([System.IO.File]::Exists("~\dockerfiles\tmp\username")){
        $user = Get-Content ~\dockerfiles\tmp\username -First 1
}
else{
        $user = $env:username.toLower()
}

echo $user
