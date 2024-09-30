function Remove-Subuser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$UserId,

        [Parameter(Mandatory)]
        [string]$Secret,

        [Parameter(Mandatory)]
        [string]$Public
    )

    $Parameters = @{
        Secret   = $Secret
        Public   = $Public
        Endpoint = 'subusers/{0}' -f $UserId
        Method   = 'DELETE'
    }

    Invoke-Reftab @Parameters
}
