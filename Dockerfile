FROM mcr.microsoft.com/powershell:latest
SHELL ["pwsh", "-c"]
COPY ./mycli.utilityfunctions .
RUN Import-Module ./mycli.utilityfunctions/UtilityFunctions.psm1
CMD Write-Output "Welcome to My CLI!"