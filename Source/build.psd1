@{
    Path = "Microsoft365ServiceStatus.psd1"
    OutputDirectory = "..\bin\Microsoft365ServiceStatus"
    Prefix = '.\_PrefixCode.ps1'
    SourceDirectories = 'Classes','Private','Public'
    PublicFilter = 'Public\*.ps1'
    VersionedOutputDirectory = $true
}
