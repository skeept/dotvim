# powershell script to copy over files compiled in source dir

$do_break = $False
$do_backup = $False

# similar to perl use strict;
Set-StrictMode -version 1

$vim_version = "vim74"

#set the default locations for the installation
switch ( Get-Content Env:ComputerName )
{
  "ISENGARD" {
    $install = "C:\Program Files\Vim\$vim_version"
    $backup = "c:\htemp\tmp"
    $source = "c:\htemp\vim"
  }
  "MIDDLE-EARTH" {
    $install = "C:\Program Files\vim\$vim_version"
    $backup = "C:\htemp\tmp"
    $source = "C:\htemp\vim"
  }
  "Gondor" {
    $install = "C:\Program Files\Vim\$vim_version"
    $backup = "C:\htemp\tmp"
    $source = "C:\htemp\vim"
  }
  "Erebor" {
    $install = "C:\Program Files\Vim\$vim_version"
    $backup = "C:\htemp\tmp"
    $source = "C:\htemp\vim"
  }
  default {
    $computername = Get-Content Env:computername
    Write-Warning "$computername not in list of know computer names!"
    $do_break = $True
  }
}

If( $do_break ) { break }

If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator"))

{
    #Write-Warning "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!"
    #Break
  $testIsAdmin = $False
  Write-Warning "You're not and Administrator!`n"
  break
}

# copy the default installation to a backup location 
If( $do_backup )
{
  Write-Output "Backup: $install --> $backup"
  Copy-Item "$install" "$backup" -recurse -force
}

#copy vim and gvim to destination
Write-Output "Copy: vim and gvim from $source\src to $install"
Copy-Item "$source\src\vim.exe" "$install" -force
Copy-Item "$source\src\gvim.exe" "$install" -force

Write-Output "Copying $source\runtime to $install"
# copy runtime folder to install location
Copy-Item "$source\runtime" "$install" -force -recurse
