function Get-M365ServiceMessages {
    [CmdletBinding()]
    param (

    )

    process {
        try {
            $uri = "$script:apiURL/Messages"
            $serviceMessages = Invoke-RestMethod -Method Get -Uri $uri -Headers $authToken -UseBasicParsing -EA Stop
            return $serviceMessages.value
        }
        catch {
            Write-Error $_
        }
    }
}