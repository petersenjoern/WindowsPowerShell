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

    - Clone the repo to the following location:

        ```
        cd ${Env:USERPROFILE}\Documents

        git clone "this repo"

        # must restart to read $profile configuration
        exit

        # start powershell.exe 
        ```

    - Before powershell.exe runs, the file named $profile must exist to configure your environments
    - You may have already a location for your PowerShell_profile.ps1 identify it by:

      ```
      $profile
      ``` 
      If so, edit the file and add:
      
      $ProfileHOME = "path_to_your_repo"
      . "$profileHOME\index.ps1"

    - If not, in the location create a file named "PowerShell_profile.ps1 and add:

      $ProfileHOME = "path_to_your_repo"
      . "$profileHOME\index.ps1"

    - In the same location, you may want to add files called:
      Microsoft.VSCode_profile.ps1 (if you are using VSCode)
      Microsoft.PowerShellSE_profile.ps1 (SE editor)

      In the files, edit the $ProfileHOME just like the files in this repo

    - Install scoop for package management (similar to wget) for automation:
        
      ```
      iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
      scoop --version
      ```

2. Start Powershell

  ## TODO: fundamental executions
  