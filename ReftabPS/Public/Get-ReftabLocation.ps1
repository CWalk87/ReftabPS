function Get-ReftabLocation {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$LocationId,

        [Parameter(Mandatory)]
        [string]$Secret,

        [Parameter(Mandatory)]
        [string]$Public
    )

    $Parameters = @{
        Secret   = $Secret
        Public   = $Public
        Endpoint = 'locations/{0}' -f $LocationId
    }

    Invoke-Reftab @Parameters
}
