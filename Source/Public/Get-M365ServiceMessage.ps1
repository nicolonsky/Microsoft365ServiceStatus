<#
.SYNOPSIS
    Retrieves Microsoft 365 Service Status Messages
.DESCRIPTION
    Retrieves service status messages from the Office 365 Service Communications API
.EXAMPLE
    Get-M365ServiceMessage
    Lists 100 most recent service messages within the tenant including status information
.EXAMPLE
    Get-M365ServiceMessage -MessageID EX213379
    Fetches specific service status message
#>
function Get-M365ServiceMessage {
    [CmdletBinding()]
    param (
        # Filter by Message ID
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $MessageID
    )

    process {
        try {

            $filter = $null

            if ($MessageID){
                $filter = "?`$filter=Id eq '$MessageID'"
            }

            $uri = "$script:apiURL/Messages" + $filter
            $serviceMessages = Invoke-RestMethod -Method Get -Uri $uri -Headers $(Get-AuthHeader) -UseBasicParsing -EA Stop
            return $serviceMessages.value
        }
        catch {
            Write-Error $_
        }
    }
}