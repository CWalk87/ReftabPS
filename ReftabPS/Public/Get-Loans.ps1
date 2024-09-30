function Get-Loans {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Secret,

        [Parameter(Mandatory)]
        [string]$Public,

        [HashTable]$SearchParameters
    )

    $Parameters = @{
        Secret = $Secret
        Public = $Public
        Endpoint = 'loans'
        SearchParameters = $SearchParameters
    }

    Invoke-Reftab @Parameters
}
