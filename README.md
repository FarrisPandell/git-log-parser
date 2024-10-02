# git-log-parser

## Examples

### Unique Emails for last 90 days

```sh
.\Read-GitLog.ps1 -Path ..\Projects\ |  Where-Object { $_.Date -ge [datetime]::Now.AddDays(-90) } | Select-Object Email | Sort-Object Email | Get-Unique -AsString
```
