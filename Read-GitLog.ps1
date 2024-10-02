#Requires -Version 7

[CmdletBinding()]
param(
    [string]$Path = "."
)

Set-StrictMode -Version Latest

if (-not (Test-Path -Path $Path)) {
    Write-Error "Path does not exist: $Path"
}
else {
    Push-Location $Path
    try {
        return (&git --no-pager log --format=format:"%h,%an,%as,%ae" | Out-String) -Split "`r`n" | ConvertFrom-Csv -Header "Commit", "Name", "Date", "Email" | ForEach-Object {
            $_.Date = [dateTime]::Parse($_.Date)
            $_
        }
    }
    finally {
        Pop-Location
    }
}