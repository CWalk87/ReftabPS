function New-Location {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$LocationName,

        [string]$LocationAddress = [string]::Empty,

        [string]$LocationPhone = [string]::Empty,

        [string]$LocationEmail = [string]::Empty,

        [string]$LocationMainContact = [string]::Empty,

        [string]$LocationNotes = [string]::Empty,

        [Parameter(Mandatory)]
        [string]$Secret,

        [Parameter(Mandatory)]
        [string]$Public
    )

    $Body = @{
        name = $LocationName
        address = $LocationAddress
        phone = $LocationPhone
        email = $LocationEmail
        mainContact = $LocationMainContact
        notes = $LocationNotes
    }

    $Parameters = @{
        Secret   = $Secret
        Public   = $Public
        Endpoint = 'locations'
        Method   = 'POST'
        Body     = $Body
    }

    Invoke-Reftab @Parameters
}
