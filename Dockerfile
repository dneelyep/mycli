FROM ubuntu:latest
##### Get terraform:
RUN apt-get update && apt-get install wget unzip -y
RUN wget https://releases.hashicorp.com/terraform/1.4.6/terraform_1.4.6_linux_amd64.zip
RUN unzip ./terraform_1.4.6_linux_amd64.zip

FROM mcr.microsoft.com/azure-powershell:latest
### Copy terraform into the PS image:
COPY --from=0 /terraform /usr/bin

### Install the Azure CLI:
RUN apt-get update && apt-get install sudo ca-certificates curl apt-transport-https lsb-release gnupg -y
RUN sudo mkdir -p /etc/apt/keyrings && curl -sLS https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null && sudo chmod go+r /etc/apt/keyrings/microsoft.gpg
RUN AZ_REPO=$(lsb_release -cs) && echo "deb [arch=`dpkg --print-architecture` signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
RUN sudo apt-get update && sudo apt-get install azure-cli
### Install network debugging tools:
RUN sudo apt-get install dnsutils iputils-ping curl wget -y

##### Setup powershell:
SHELL ["pwsh", "-Command"]
RUN Install-Module Microsoft.PowerShell.SecretManagement, Microsoft.PowerShell.SecretStore -Scope CurrentUser -Force
# See these links for some notes on PowerShell's finicky behavior around module naming:
#     - https://stackoverflow.com/a/23168236
#     - https://learn.microsoft.com/en-us/powershell/scripting/developer/module/installing-a-powershell-module?view=powershell-7.3

ADD mycli.utilityfunctions /usr/local/share/powershell/Modules/UtilityFunctions
RUN mkdir ~/.config/powershell
ADD Microsoft.PowerShell_profile.ps1 /root/.config/powershell/Microsoft.PowerShell_profile.ps1
ENTRYPOINT [ "pwsh" ]