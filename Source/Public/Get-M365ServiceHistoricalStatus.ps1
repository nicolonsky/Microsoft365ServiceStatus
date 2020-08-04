function Get-M365ServiceHistoricalStatus {
    [CmdletBinding()]
    param (
        
    )
    
    process {
        try {
            $uri = "$script:apiURL/HistoricalStatus"
            $historicalStatus = Invoke-RestMethod -Method Get -Uri $uri -Headers $authToken -UseBasicParsing -EA Stop
            return $historicalStatus.value
        }
        catch {
            Write-Error $_
        }
    }
}