
Get-WmiObject -Class Win32_UserProfile -Computername Computername -Filter "SID = 'PROFILE-SID'" 
Remove-WmiObject -InputObject PROFILE-SID  # Remove Profile