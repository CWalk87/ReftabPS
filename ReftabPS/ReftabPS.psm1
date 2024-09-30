$PrivateScriptRoot = Join-Path $PSScriptRoot 'Private' -Resolve
Get-ChildItem -Path $PrivateScriptRoot -Filter *.ps1 | ForEach-Object {
    . $_.FullName
}

$PublicScriptRoot = Join-Path $PSScriptRoot 'Public' -Resolve
Get-ChildItem -Path $PublicScriptRoot -Filter *.ps1 | ForEach-Object {
    . $_.FullName
}
