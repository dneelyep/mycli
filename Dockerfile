FROM mcr.microsoft.com/powershell:latest
SHELL ["pwsh", "-c"]
ADD mycli.utilityfunctions .
COPY StartupScript.ps1 /root/.config/powershell/Microsoft.PowerShell_profile.ps1
CMD pwsh