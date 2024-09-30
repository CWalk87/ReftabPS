function Get-Locations {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Secret,

        [Parameter(Mandatory)]
        [string]$Public
    )

    $Parameters = @{
        Secret   = $Secret
        Public   = $Public
        Endpoint = 'locations'
    }

    Invoke-Reftab @Parameters
}
