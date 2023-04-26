FROM mcr.microsoft.com/powershell:latest
# See these links for some notes on PowerShell's finicky behavior around module naming:
#     - https://stackoverflow.com/a/23168236
#     - https://learn.microsoft.com/en-us/powershell/scripting/developer/module/installing-a-powershell-module?view=powershell-7.3
ADD mycli.utilityfunctions /usr/local/share/powershell/Modules/UtilityFunctions
ENTRYPOINT [ "pwsh" ]