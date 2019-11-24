function docker-build-image {
    param(
        [Parameter(Position=0, Mandatory=$true)][string]$repoName,
        [Parameter(Position=1, Mandatory=$true)][string]$imageName
    )
    docker build -t "$repoName/$imageName" .
}

function docker-run-latest-image-background {
    $latestImage = docker image ls -a --no-trunc -q | Select -first 1
    docker run -d $latestImage
}

function docker-run-latest-image-interactive {
    $latestImage = docker image ls -a --no-trunc -q | Select -first 1
    docker run -it $latestImage
}

function docker-remove-image {
    param(
        [Parameter(Position=0, Mandatory=$true)][string]$imageName
    )
    docker image rm $imageName -f
}

function docker-remove-latest-image {
    $latestImage = docker image ls -a --no-trunc -q | Select -first 1
    docker image rm $latestImage -f
}

function docker-tag-image-acr {
    # 3. Tag <your-image> image with the loginServer of your container registry. 
    # Also, add the :v1 tag to the end of the image name to indicate the image version number. 
    # Replace <acrLoginServer> with the result of the az acr show command.
    param(
        $ImageName,
        $ImageVersion,
        $acrLoginServer
    )
    docker tag $ImageName "${acrLoginServer}/${ImageName}:${ImageVersion}"
}

function docker-push-image-acr {
    # 4. Now that you've tagged the <your-image> image with the full login 
    # server name of your private registry, 
    # you can push it to the registry with the docker push command.
    param(
        $ImageName,
        $ImageVersion,
        $acrLoginServer
    )
    docker push "${acrLoginServer}/${ImageName}:${ImageVersion}"
}