# -------------------------------
# 1. Unlock the user account
# -------------------------------
Unlock-ADAccount -Identity bob

# -------------------------------
# 2. Reset the user's password
# -------------------------------
Set-ADAccountPassword -Identity bob -Reset -NewPassword (ConvertTo-SecureString "B0b@2025!" -AsPlainText -Force)

# -------------------------------
# 3. Verify that the account is unlocked
# -------------------------------
Get-ADUser -Identity bob -Properties LockedOut | Select-Object Name, LockedOut
