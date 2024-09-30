function New-Loan {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [PSCustomObject]$Body,

        [Parameter(Mandatory)]
        [string]$Secret,

        [Parameter(Mandatory)]
        [string]$Public
    )

    $Parameters = @{
        Secret = $Secret
        Public = $Public
        Method = 'POST'
        Body = $Body
        Endpoint = 'loans'
    }

    Invoke-Reftab @Parameters
}
