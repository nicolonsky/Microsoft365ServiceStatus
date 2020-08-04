<#
.SYNOPSIS
    Builds authorization header
.DESCRIPTION
    Builds and authorization header containing the stored MSAL access token which is passed within the "Header" section for Invoke-RestMethod calls
.EXAMPLE
    Get-AuthHeader
    Returns authorization header
#>
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