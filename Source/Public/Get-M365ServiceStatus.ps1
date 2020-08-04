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