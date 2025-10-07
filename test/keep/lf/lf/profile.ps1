# minimal profile for using in lf file manager

$customPaths = @(
    "$HOME\.local\bin",
    "$HOME\.cargo\bin",
    "$HOME\scoop\shims",
    "C:\Program Files\Git\cmd",
    "C:\Program Files\7-Zip"
    "C:\mt"
)

# Get the existing system PATH, split it into an array
$existingPath = ($env:PATH -split ';')

# Combine your custom paths with the existing ones
$combinedPath = $customPaths + $existingPath

# Filter for unique entries (case-insensitive) and remove any empty ones
$uniquePath = $combinedPath | Where-Object { $_ } | Select-Object -Unique

# Join the array back into a single string and set it as the new PATH
$env:PATH = $uniquePath -join ';'
