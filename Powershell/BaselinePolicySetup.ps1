# Import required modules
Import-Module GroupPolicy
Import-Module ActiveDirectory

# -------------------------------
# 1. Create and Configure DisableControlPanel GPO
# -------------------------------
New-GPO -Name "DisableControlPanel" -Comment "Disables Control Panel for standard users"

# Link GPO to the UsersAccounts OU
New-GPLink -Name "DisableControlPanel" -Target "OU=UsersAccounts,DC=PatchLab,DC=local"

# Configure registry setting to block Control Panel
Set-GPRegistryValue -Name "DisableControlPanel" `
    -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" `
    -ValueName "NoControlPanel" `
    -Type DWord `
    -Value 1

# Force GPO update
gpupdate /force

# -------------------------------
# 2. Create and Link BaselinePolicy GPO
# -------------------------------
New-GPO -Name "BaselinePolicy"
New-GPLink -Name "BaselinePolicy" -Target "DC=PatchLab,DC=local"

# -------------------------------
# 3. Configure Domain Password & Lockout Policies
# -------------------------------
Set-ADDefaultDomainPasswordPolicy -Identity "patchlab.local" `
    -MinPasswordLength 8 `
    -ComplexityEnabled $true `
    -LockoutThreshold 5 `
    -LockoutDuration (New-TimeSpan -Minutes 30)

# Verify the policy
Get-ADDefaultDomainPasswordPolicy
