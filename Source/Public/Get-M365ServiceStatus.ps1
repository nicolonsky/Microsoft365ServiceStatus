<#
.SYNOPSIS
    Retrieves Microsoft 365 Service Status
.DESCRIPTION
    Retrieves service status from the Office 365 Service Communications API
.EXAMPLE
    Get-M365ServiceStatus 
    Lists all available services within the tenant including status information
.EXAMPLE
    Get-M365ServiceStatus -Brief
    Lists all available services within the tenant including most important status information
#>
function Get-M365ServiceStatus {
    [CmdletBinding()]
    param (
        # Only show brief status
        [Parameter()]
        [switch]
        $Brief
    )

    process {
        try {
            $uri = "$script:apiURL/CurrentStatus"
            $serviceStatus = Invoke-RestMethod -Method Get -Uri $uri -Headers $(Get-AuthHeader) -UseBasicParsing -EA Stop

            if ($Brief.isPresent) {
                return $serviceStatus.value | Select-Object -Property WorkloadDisplayName, StatusDisplayName, IncidentIds, StatusTime
            }
            else {
                return $serviceStatus.value
            }  
        }
        catch {
            Write-Error $_
        }
    }
}