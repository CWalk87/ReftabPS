function Set-Loanee {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$LoaneeId,

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
        Method   = 'PUT'
        Body     = $Body
        Endpoint = 'loanees/{0}' -f $LoaneeId
    }

    Invoke-Reftab @Parameters
}
