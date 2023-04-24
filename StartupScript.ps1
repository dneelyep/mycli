Import-Module /UtilityFunctions.psm1

Write-Output "=============================="
Write-Output "===== Welcome to My CLI! ====="
Write-Output "=============================="


Write-Thing -Thing "Here's the Write-Thing function"

Write-Output "Listing-processes..."
List-Processes

Write-Output "Getting contents of root directory..."
Get-Contents-Of-Root-Directory