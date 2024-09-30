function Get-Loanees {
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
        Endpoint         = 'loanees'
        SearchParameters = $SearchParameters
    }

    Invoke-Reftab @Parameters
}
