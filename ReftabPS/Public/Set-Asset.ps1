function Set-Asset {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$AssetId,

        [Parameter(Mandatory)]
        [PSCustomObject]$Body,

        [Parameter(Mandatory)]
        [string]$Secret,

        [Parameter(Mandatory)]
        [string]$Public
    )

    $Parameters = @{
        Secret   = $Secret
        Public   = $Public
        Method   = 'PUT'
        Body     = $Body
        Endpoint = 'assets/{0}' -f $AssetId
    }

    Invoke-Reftab @Parameters
}
