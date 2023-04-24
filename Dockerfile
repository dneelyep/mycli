FROM mcr.microsoft.com/powershell:latest
SHELL ["pwsh", "-c"]
CMD Write-Output "Welcome to My CLI!"