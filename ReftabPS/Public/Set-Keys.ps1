function Set-Keys {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Secret,

        [Parameter(Mandatory)]
        [string]$Public
    )

    $Commands = Get-Command -Module ReftabPS

    foreach ($Command in $Commands.Name) {
        $global:PSDefaultParameterValues.Add(('{0}:Secret' -f $Command), $Secret)
        $global:PSDefaultParameterValues.Add(('{0}:Public' -f $Command), $Public)
    }
}
