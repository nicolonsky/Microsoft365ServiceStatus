function Get-APIUrl {
    [CmdletBinding()]
    param (
        
    ) 

    process {
        return @{
            URL = $script:apiURL
        }   
    }
}