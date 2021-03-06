## Using scoop.sh (the missing apt-get install for windows)
function scoop-install-all {
    scoop bucket add extras
    scoop bucket add versions  
    scoop install 7zip 
    scoop install git 
    scoop install sudo 
    scoop install touch
    scoop install win32-openssh 
    scoop install azure-cli
    az extension add --name azure-devops 
    scoop install pwsh
    scoop install concfg
    scoop install vscode 
    scoop install chrome
}


function scoop-install-web-tools {
    # https://github.com/lukesampson/scoop/wiki/Switching-Ruby-And-Python-Versions
    scoop bucket add versions
    scoop install python37 python
    scoop install Go
    scoop install minikube
    pip install httpie
    scoop install nodejs
    npm install npm --global
    npm install typescript --global
    # scoop install dotnet-sdk
    # npm install @angular/cli @nestjs/cli typescript --global
}

function scoop-update-all {
<#
    How to update everything? 
    scoop  help update
#>
    scoop update 
    scoop update * --force --quiet
}


function scoop-help {
    scoop  --help 
}


function scoop-list {
    scoop list
}


function scoop-homepage {
    param($appName)
    scoop home $appName
}


function scoop-info {
    param($appName)
    scoop info $appName
}

    
function scoop-uninstall {
    param($appName)
    scoop uninstall $appName
}
