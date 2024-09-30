function Get-Loanee {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$LoaneeId,

        [Parameter(Mandatory)]
        [string]$Secret,

        [Parameter(Mandatory)]
        [string]$Public
    )

    $Parameters = @{
        Secret   = $Secret
        Public   = $Public
        Endpoint = 'loanees/{0}' -f $LoaneeId
    }

    Invoke-Reftab @Parameters
}
