function Invoke-Reftab {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Secret,

        [Parameter(Mandatory)]
        [string]$Public,

        [ValidateSet('GET', 'POST', 'PUT', 'DELETE')]
        [string]$Method = 'GET',

        [Parameter(Mandatory)]
        [string]$Endpoint,

        [PSCustomObject]$Body,

        [HashTable]$SearchParameters
    )
    $Uri = 'https://www.reftab.com/api/{0}' -f $Endpoint

    if ($SearchParameters) {
        $Uri += '?'
        $ParamCollection = @()
        foreach ($Param in $SearchParameters.Keys) {
            $ParamCollection += '{0}={1}' -f $Param, $SearchParameters[$Param]
        }
        $Uri += $ParamCollection -join '&'
    }

    $MD5 = ''
    $ContentType = ''

    if ($Body) {
        $Body = $Body | ConvertTo-Json
        $Body = [System.Text.Encoding]::UTF8.GetBytes($Body)
        $MD5Provider = [System.Security.Cryptography.MD5CryptoServiceProvider]::new()
        $MD5 = [BitConverter]::ToString($MD5Provider.ComputeHash($Body))
        $MD5 = $MD5.ToLower() -replace '-', ''
        $ContentType = 'application/json'
    }

    $Now = Get-Date -Format 'o'

    $SignatureToSign = $Method + "`n" +
    $MD5 + "`n" +
    $ContentType + "`n" +
    $Now + "`n" +
    $Uri

    $HMACSHA = [System.Security.Cryptography.HMACSHA256]::new()
    $HMACSHA.Key = [System.Text.Encoding]::UTF8.GetBytes($Secret)
    $Signature = $HMACSHA.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($SignatureToSign))
    $Signature = [BitConverter]::ToString($Signature) -replace '-', ''
    $Signature = $Signature.ToLower()
    $Signature = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($Signature))

    $Headers = @{
        Accept        = 'application/json'
        Authorization = 'RT {0}:{1}' -f $Public, $Signature
        'x-rt-date'   = $Now
    }
    try {
        Invoke-RestMethod -Uri $Uri -Method $Method -Body $Body -Headers $Headers
    }
    catch {
        $StreamReader = [System.IO.StreamReader]::new($_.Exception.Response.GetResponseStream())
        $ErrResp = $StreamReader.ReadToEnd() | ConvertFrom-Json
        $StreamReader.Close()
        throw "$(@{StatusCode = $_.Exception.Response.StatusCode.Value__; Description = $_.Exception.Response.StatusDescription; Message = $ErrResp.Error} | ConvertTo-Json)"
    }
}
