# Import Active Directory module
Import-Module ActiveDirectory

# -------------------------------
# 1. Create Organizational Units
# -------------------------------
New-ADOrganizationalUnit -Name "UsersAccounts" -Path "DC=PatchLab,DC=local"
New-ADOrganizationalUnit -Name "IT" -Path "DC=PatchLab,DC=local"

# -------------------------------
# 2. Create Security Group
# -------------------------------
New-ADGroup -Name "IT_Admins" `
    -SamAccountName "IT_Admins" `
    -GroupScope Global `
    -GroupCategory Security `
    -Path "OU=IT,DC=PatchLab,DC=local"

# -------------------------------
# 3. Create a test user (Bob)
# -------------------------------
$pwd = ConvertTo-SecureString "P@ssw0rd1!" -AsPlainText -Force
New-ADUser -Name "Bob" `
    -GivenName "Bob" `
    -Surname "Test" `
    -SamAccountName "bob" `
    -AccountPassword $pwd `
    -Enabled $true `
    -Path "OU=UsersAccounts,DC=PatchLab,DC=local"

# -------------------------------
# 4. Add Administrator to IT_Admins group (optional)
# -------------------------------
Add-ADGroupMember -Identity "IT_Admins" -Members "Administrator"
