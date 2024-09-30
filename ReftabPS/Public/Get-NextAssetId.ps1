function Get-NextAssetId {
    [CmdletBinding()]
    param(
        [Parameter()]
        [string]$LocationId,

        [Parameter(Mandatory)]
        [string]$Secret,

        [Parameter(Mandatory)]
        [string]$Public
    )

    $Parameters = @{
        Secret   = $Secret
        Public   = $Public
        Endpoint = 'nextasset'
    }

    if ($LocationId) {
        $Parameters['SearchParameters'] = @{clid = $LocationId }
    }

    Invoke-Reftab @Parameters
}
