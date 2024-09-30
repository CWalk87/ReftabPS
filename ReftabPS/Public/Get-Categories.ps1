function Get-Categories {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Secret,

        [Parameter(Mandatory)]
        [string]$Public
    )

    $Parameters = @{
        Secret           = $Secret
        Public           = $Public
        Endpoint         = 'categories'
    }

    Invoke-Reftab @Parameters
}
