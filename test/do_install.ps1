# Install / create archive with new compiles files

Param(
    [string]$dest='C:\Program Files\vim\vim80',
    [string]$source='C:\htemp\vim',
    [switch]$arch
)

if(-not [bool]$arch) {
  $iden_curr = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent())
  if(-not $iden_curr.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "you should be Administrator to perform this operation"
    return
  }
}

if([bool]$arch) {
  $name = Join-path ([io.path]::GetTempPath()) (Get-Date -UFormat "__VIM__%Y_%m_%d")
  mkdir $name
  $dest = $name
}

# do the copy

write-host "Copying elements to $dest"
write-host "Copy vim.exe and gvim.exe"

Copy-Item (Join-Path $source (Join-path src '*vim*.exe')) "$dest" -force

write-host "Copy $source\runtime folder to $dest"
Copy-item -recurse -force -path (Join-path $source runtime) -destination "$dest"

if([bool]$arch) {
  $sevenz = 'C:\Program Files\7-Zip\7z.exe'
  $vimproc = Join-path "$($env:HOME)" 'vimfiles\bundle\vimproc\lib\*'
  mkdir "$dest\vimproc_lib" | out-null
  copy-item -recurse -force $vimproc "$dest\vimproc_lib"
  $output = "${dest}.7z"
  "& $sevenz a $output $dest"
  & $sevenz a $output $dest
  write-host "`n7Z archive: $output"
  cp $output ~\Dropbox\tmp
  rm -recurse "$dest"
}


