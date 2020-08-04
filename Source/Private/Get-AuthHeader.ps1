function Get-AuthHeader {
    [CmdletBinding()]
    param (

    )

    process {
        if ($null -ne $script:msalToken) {
            return @{
                "Content-Type"  = "application/json"
                "Authorization" = $script:msalToken.CreateAuthorizationHeader()
                "ExpiresOn"     = $script:msalToken.ExpiresOn.LocalDateTime
            }
        }
        else {
            throw "You need to obtain and store an access token with `"Get-MsalToken`" & `"Set-MsalToken`" before you can use this module."
        }
    }
}