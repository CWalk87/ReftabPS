function Get-Category {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$CategoryId,

        [Parameter(Mandatory)]
        [string]$Secret,

        [Parameter(Mandatory)]
        [string]$Public
    )

    $Parameters = @{
        Secret   = $Secret
        Public   = $Public
        Endpoint = 'categories/{0}' -f $CategoryId
    }

    Invoke-Reftab @Parameters
}
