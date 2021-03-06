$Credential = (Get-Credential)
$PSSession = New-PSSession -ComputerName ComputerName -Credential $Credential | Enter-PSSession

          
 # Get Profiles
 Try
  { # Start Try, Get Sid and translate them
   $GetSids = Get-WmiObject -Class Win32_UserProfile -Filter "Special=False" | Select-Object Sid, @{Label='LastUseTime';Expression={$_.ConvertToDateTime($_.LastUseTime)}} 
    ForEach ($UserSid in $GetSids)
    { # Start ForEach ($UserSid in $GetSids)      
     $SID = New-Object System.Security.Principal.SecurityIdentifier($UserSid.sid)            
     $UserAccount = $SID.Translate([System.Security.Principal.NTAccount])            
     $Profile = $UserAccount.value.split("\")[1];  

     Write-Host $SID, $Profile, $UserSid.LastUseTime
   } # End ForEach ($UserSid in $GetSids)     
  } # End Try, Get Sid and translate them

Catch
  {  # Start Catch, Get Sid and translate them
   Write-Warning -Message "## ERROR## " 
   Write-Warning -Message "## Script could not start ## " 
   Write-Warning $Error[0]
  }  # End Catch, Get Sid and translate them

Stop-Transcript
