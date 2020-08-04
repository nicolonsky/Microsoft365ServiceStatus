function Set-MsalToken {
    [CmdletBinding()]
    param (
        # Store MsalToken
        [Parameter(Mandatory)]
        [object]
        $MsalToken
    )

    process {
        $script:msalToken = $MsalToken
        $script:apiURL = "https://manage.office.com/api/v1.0/$($script:msalToken.TenantId)/ServiceComms"
    }
}