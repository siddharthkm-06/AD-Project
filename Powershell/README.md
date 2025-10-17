# PowerShell Scripts — IAM Homelab

This folder contains the PowerShell automation used in the lab.

## 🧩 Scripts Included
- **CreateUsersAndGroups.ps1** — Creates OUs, groups, and test user accounts.  
- **BaselinePolicySetup.ps1** — Configures password & lockout policies, disables Control Panel for users in the `UsersAccounts` OU.  
- **UnlockAndResetBob.ps1** — Demonstrates account unlock & password reset for locked user `bob`.

## ⚙️ How to Run
Run each script on the Domain Controller PowerShell (Admin mode):
```powershell
Set-ExecutionPolicy RemoteSigned
.\01_AD_Setup.ps1

