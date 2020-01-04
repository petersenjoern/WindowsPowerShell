# Curl alias using docker
function docker-curl {
    param(
        [Parameter(Position=0, Mandatory=$true)][string]$args
    )
    docker run --rm byrnedo/alpine-curl $args
 }