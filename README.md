# AD-Project
# IAM Homelab — patchlab.local

## 🧭 Overview
Lightweight Active Directory homelab to practice core **Identity & Access Management (IAM)** and **Windows administration** concepts.

- Windows Server 2019 as Domain Controller (AD DS, DNS)
- Windows 10 Pro client (domain-joined)
- Security policies applied via Group Policy Objects (GPO)
- Event log analysis and account lockout simulation

## 🌐 Network Setup
Host-Only network: `192.168.56.0/24`
- DC: `192.168.234.3`
- Client: `192.168.234.5`

## 🧩 Key Skills Practiced
- User and Group provisioning in **Active Directory**
- Implemented Group Policy Objects (GPOs) to enforce password policy, account lockout, and disable Control Panel for standard users.
- Using **PowerShell** for AD and GPO management
- Reviewed security events (Event ID 4624, 4625) using PowerShell:
  `Get-EventLog -LogName Security -InstanceId 4625 -Newest 10 | Select TimeGenerated, Message`
  to validate failed login detection and account lockout.
- Troubleshooting DNS and domain join issues

## 🧱 How to Reproduce
1. Install and configure Windows Server 2019 in VirtualBox  
2. Promote to Domain Controller: `Install-ADDSForest -DomainName patchlab.local`  
3. Create OUs, users, and GPOs using PowerShell scripts from `/scripts/`  
4. Join Windows 10 client to domain and verify policy enforcement  
5. Trigger login failures, inspect logs via Event Viewer or PowerShell  

## 🧾 Evidence
- `Screenshots/ControlPanel_Blocked.png` — Control Panel restriction applied  
- `Screenshots/Account_Locked.png` — Account lockout after failed attempts  

## 🧠 Learning Outcome
Built foundational skills in **Active Directory administration**, **policy enforcement**, and **identity security** using a controlled homelab.


