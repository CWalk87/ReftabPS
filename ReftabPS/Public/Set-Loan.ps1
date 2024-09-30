function Set-Loan {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$LoanId,

        [Parameter(Mandatory)]
        [pscustomobject]$Body,

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
        Endpoint = 'loans/{0}' -f $LoanId
    }

    Invoke-Reftab @Parameters
}
