<#
.SYNOPSIS
    Stores a MSAL token for future usage with this module.
.DESCRIPTION
    This command will store an MSAL token within the $script: scope.
.EXAMPLE
    $accessToken = Get-MsalToken -ClientId "10d3c3cb-8b79-481c-bf48-1c35eceb0c75" -TenantId "nicolasuter.ch" -Scope "https://manage.office.com/ServiceHealth.Read"
    Set-MsalToken -MsalToken $accessToken
    Stores the MSAL access token for this module to call other cmdlets.
#>
function Set-MsalToken {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        # Store MsalToken
        [Parameter(Mandatory)]
        [object]
        $MsalToken
    )

    process {
        if ($PSCmdlet.ShouldProcess($script:msalToken, "Storing token for this module")) {
            $script:msalToken = $MsalToken
            $script:apiURL = "https://manage.office.com/api/v1.0/$($script:msalToken.TenantId)/ServiceComms"
        }
    }
}