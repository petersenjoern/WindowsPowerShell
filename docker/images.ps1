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