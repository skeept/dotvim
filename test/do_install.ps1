



If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator"))

{
    #Write-Warning "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!"
    #Break
  $testIsAdmin = $False
  Write-Warning "You're not and Administrator!!!`n"
  Write-Warning "Run this as Administrator!!!`n"
  break
}

#set the default locations for the installation
$install = "c:\Program Files\vim\vim73"
$backup = "c:\htemp\tmp"
$source = "c:\htemp\vim"

# copy the default installation to a backup location 
Write-Output "Backup: $install --> $backup"
Copy-Item $install $backup -recurse -force

#copy vim and gvim to destination
Write-Output "Copy: vim and gvim from $source\src to $install"
Copy-Item "$source\src\vim.exe" "$install" -force
Copy-Item "$source\src\gvim.exe" "$install" -force

Write-Output "Copying $source\runtime to $install"
# copy runtime folder to install location
Copy-Item "$source\runtime" $install -force -recurse
