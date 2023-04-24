function Write-Thing {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Thing
    )
    Write-Output "Hello, $($Thing)!"
}

function List-Processes {
    Get-Process
}

function Get-Contents-Of-Root-Directory {
    Get-ChildItem /
}