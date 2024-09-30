function Remove-Asset {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$AssetId,

        [Parameter(Mandatory)]
        [string]$Secret,

        [Parameter(Mandatory)]
        [string]$Public
    )

    $Parameters = @{
        Secret   = $Secret
        Public   = $Public
        Endpoint = 'assets/{0}' -f $AssetId
        Method   = 'DELETE'
    }

    Invoke-Reftab @Parameters
}
