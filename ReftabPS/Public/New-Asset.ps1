function New-Asset {
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
        Secret   = $Secret
        Public   = $Public
        Method   = 'POST'
        Body     = $Body
        Endpoint = 'assets'
    }

    Invoke-Reftab @Parameters
}
