function Get-Subusers {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Secret,

        [Parameter(Mandatory)]
        [string]$Public,

        [HashTable]$SearchParameters
    )

    $Parameters = @{
        Secret           = $Secret
        Public           = $Public
        Endpoint         = 'subusers'
        SearchParameters = $SearchParameters
    }

    Invoke-Reftab @Parameters
}
