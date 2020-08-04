# Microsoft 365 Service Status

[![PowerShell Gallery Version](https://img.shields.io/powershellgallery/v/Microsoft365ServiceStatus?label=PS%20Gallery%20Version&style=flat-square)](https://www.powershellgallery.com/packages/Microsoft365ServiceStatus) [![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/Microsoft365ServiceStatus?label=PS%20Gallery%20downloads&style=flat-square)](https://www.powershellgallery.com/packages/Microsoft365ServiceStatus) ![GitHub](https://img.shields.io/github/license/nicolonsky/Microsoft365ServiceStatus?style=flat-square)

PowerShell module to retrieve Microsoft 365 service status information from the [Office 365 Service Communications API](https://docs.microsoft.com/en-us/office/office-365-management-api/office-365-service-communications-api-reference).

![Get-M365ServiceStatus](https://user-images.githubusercontent.com/32899754/89341042-fe6eb100-d6a0-11ea-80a7-e7357f9717c5.gif)


## Set-up

### Initial

1. Create an app registration
   1. Add `http://localhost` as reply URL (PowerShell 7)
   2. Add `https://login.microsoftonline.com/common/oauth2/nativeclient` as reply URL (PowerShell 5.1)
2. Install the module from PowerShell Gallery
   1. `Install-Module -Name Microsoft365ServiceStatus`

### Authenticating to the Office 365 Service Communications API

Obtain an access token via MSAL PS (feel free to use another authentication flow):

```powershell
$accessToken = Get-MsalToken -ClientId "10d3c3cb-8b79-481c-bf48-1c35eceb0c75" -TenantId "nicolasuter.ch" -Scope "https://manage.office.com/ServiceHealth.Read"
```
Store the token within script context:

```powershell
Set-MsalToken -MsalToken $accessToken
```

## Cmdlets

Service status:

```powershell
Get-M365ServiceStatus
```

Service status (brief):

```powershell
Get-M365ServiceStatus -Brief
```

Service status messages:

```powershell
Get-M365ServiceMessage
```

Retrieve specific service status message:

```powershell
Get-M365ServiceMessage -MessageID EX213379
```

Service status history:

```powershell
Get-M365ServiceHistoricalStatus
```