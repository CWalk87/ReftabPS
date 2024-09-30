function Set-Subuser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$UserId,

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
        Endpoint = 'subusers/{0}' -f $UserId
    }

    Invoke-Reftab @Parameters
}
