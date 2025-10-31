# ## ai gen thing to get ad module better
# if (-not (Get-Module -ListAvailable -Name ActiveDirectory)) {
#     Write-Error "ActiveDirectory module not found. Install RSAT or import the module."
    
# }
# ## you need ad module for ad commands
# Import-Module ActiveDirectory -ErrorAction Stop

## get the active directory users currently present
$actualUsers = Get-LocalUser -Name *

Write-Host "what users are supposed to be present? end input with 2 white lines"
$supposedUsers = @() 
while ($true) { ## ngl this while statement is straight from the gpt
    $line = Read-Host
    if ([string]::IsNullOrWhiteSpace($line)) { break }
    $supposedUsers += $line.Trim()
}
## unnesscary
# if (supposedUsers.Count -eq 0) {
#     Write-Host "enter users dummy"
#     exit 0
# }

$correctUsers = @()
$missingUsers = @()

foreach ($user in $supposedUsers) {
    if ($actualUsers.Contains($user)) {
        $correctUsers += $user
        Write-Host "$user is a correct user"
    } else {
        $missingUsers += $user
        Write-Host "$user is not correct"
    }
}
foreach ($user in $correctUsers) {
    Write-Host "$user is good"
}
foreach ($user in $missingUsers) {
    Write-Host "$user is BAD!!!"
}
Write-Host "$missingUsers is bad"