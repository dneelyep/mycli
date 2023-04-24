FROM mcr.microsoft.com/powershell:latest
SHELL ["pwsh", "-c"]
ADD mycli.utilityfunctions .
CMD Write-Output "Import-Module /UtilityFunctions.psm1; Welcome to My CLI!"