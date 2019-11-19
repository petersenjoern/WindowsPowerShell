# Introduction
$PROFILE for WindowsPowerShell

This is a collection of WindowsPowerShell scripts to speed-up tasks by using automation.
The collection contributes to: 
    1. speed-up development 
    2. reproducibility
    3. procedure-alignment among developers (consistency)

The Project is inspired by DevOps Engineer Jalal Hejazi

# Repo overview
#### TODO: list directories and functionality summary
- tools: 
    -- scoop CLI with Powershell to automate the installation process like linux: 'https://get.scoop.sh'
TODO: add docker functionalities
TODO: add SSH-init for remote VMs

# Getting Started
1. Setup

    - Before powershell.exe runs, the file named $profile must exist to configure your environments
      To achieve this, follow the following commands:

        ```
        cd ${Env:USERPROFILE}\Documents

        git clone "this repo"

        # must restart to read $profile configuration
        exit

        # start powershell.exe 
        ```

    - Or edit Microsoft.PowerShell_profile.ps1, Microsoft.PowerShellSE_profile.ps1 
      and Microsoft.VSCode_profile.ps1 accordingly to the location to where you are cloning this repo