<#
.SYNOPSIS
    Retrieves historical Microsoft 365 Service Status information
.DESCRIPTION
    Retrieves historical service status from the Office 365 Service Communications API
.EXAMPLE
    Get-M365ServiceHistoricalStatus
    Lists historical service status 
#>
function Get-M365ServiceHistoricalStatus {
    [CmdletBinding()]
    param (
        
    )
    
    process {
        try {
            $uri = "$script:apiURL/HistoricalStatus"
            $historicalStatus = Invoke-RestMethod -Method Get -Uri $uri -Headers $(Get-AuthHeader) -UseBasicParsing -EA Stop
            return $historicalStatus.value
        }
        catch {
            Write-Error $_
        }
    }
}