FROM mcr.microsoft.com/powershell:latest
SHELL ["pwsh", "-c"]
ADD MyCli.UtilityFunctions .
RUN Import-Module MyCli.UtilityFunctions/UtilityFunctions.psm1
CMD Write-Output "Welcome to My CLI!"