FROM mcr.microsoft.com/powershell:latest
SHELL ["pwsh", "-c"]
ADD mycli.utilityfunctions .
RUN Import-Module UtilityFunctions.psm1
CMD Write-Output "Welcome to My CLI!"