function Get-Assets {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Secret,

        [Parameter(Mandatory)]
        [string]$Public,

        [HashTable]$SearchParameters = @{limit=1000;offset=0}
    )

    $Parameters = @{
        Secret           = $Secret
        Public           = $Public
        Endpoint         = 'assets'
        SearchParameters = $SearchParameters
    }

    Invoke-Reftab @Parameters
}
