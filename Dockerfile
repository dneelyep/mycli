FROM mcr.microsoft.com/azure-powershell:latest
SHELL ["pwsh", "-Command"]
RUN Install-Module Microsoft.PowerShell.SecretManagement, Microsoft.PowerShell.SecretStore -Scope CurrentUser -Force
# See these links for some notes on PowerShell's finicky behavior around module naming:
#     - https://stackoverflow.com/a/23168236
#     - https://learn.microsoft.com/en-us/powershell/scripting/developer/module/installing-a-powershell-module?view=powershell-7.3
ADD bin/terraform /bin/terraform
ADD mycli.utilityfunctions /usr/local/share/powershell/Modules/UtilityFunctions
RUN mkdir ~/.config/powershell
ADD Microsoft.PowerShell_profile.ps1 /root/.config/powershell/Microsoft.PowerShell_profile.ps1
ENTRYPOINT [ "pwsh" ]