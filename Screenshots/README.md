### 1. AD Installation
![AD Setup](screenshots/AD_Installation.png)
Shows Windows Server promoted as Domain Controller (PatchLab.local) with AD DS installed successfully.

### 2. Organizational Units and Users
![OU](screenshots/OU.png)
![Users](screenshots/ADUser.png)
![Groups](screenshots/ADGroup.png)
Displays created OUs (UsersAccounts, IT), group (IT_Admins), and user (bob).

### 3. Group Policies Created
![GPO List](screenshots/GPO_List.png)
Verifies creation of 'DisableControlPanel' and 'BaselinePolicy' Group Policies.

### 5. Domain Password Policy
![Password Policy](screenshots/Password_Policy.png)
Shows domain password policy with complexity, length (8), and account lockout settings.

### 6. GPO Applied on Client
![GPO Result](screenshots/Bob_GPO_Result.png)
Confirms 'DisableControlPanel' GPO applied to Bob’s account on Windows 10 client.

### 7. Security Audit Event Log
![EventLog 4625](screenshots/EventLog_4625.png)
Shows multiple failed logon attempts (Event ID 4625) generated during audit simulation.

### 8. Control Panel Restriction
![Block Control Panel](screenshots/ControlPanel_Blocked.png)
Bob’s account successfully received the Disable Control Panel policy, confirming GPO application.

### 9. Lockout Account
![Account Locked Out](screenshots/Account_Locked.png)
Bob’s account locked after repeated failed login attempts, validating the Baseline Password & Lockout Policy.
