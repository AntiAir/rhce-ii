# RHCE-II Ansible 

RHCE preparation

## 📌 Files

*   **`ansible.cfg`**：Ansible parameters。
*   **`inventory`**：Controlled terminal definition
*   **`packages.sh`**： Shell script to build up repository
*   **`cent.yml` / `cent_absent.yml`**：Add and Delete the repository
*   **`cent_lifecycle.yml`**：Repository to add or delete by using parameters.
*   **`httpd.yml`**：Deploy Apache Web using port 83. Make a manual to remind to change port number in manual if the question to indicate another specific port.


### 1. Preparation
Make sure（Control Node） Ansible installed， SSH every nodes without password defined in `inventory` 。
ansible.cfg
[defaults]
inventory = ./inventory
remote_user = automation
host_key_checking = False

[privilege_escalation]
become = True
become_method = sudo
become_user = root
become_ask_pass = False

### 2. repolist add or delete (cent_lifecycle.yml)
```bash
ansible-playbook -i inventory cent_lifecycle.yml -t install    # add a repository
ansible-playbook -i inventory cent_lifecycle.yml -t create     # add a repository
ansible-playbook -i inventory cent_lifecycle.yml -t remove     # remove a repository
ansible-playbook -i inventory cent_lifecycle.yml -t delete     # remove a repository
```
### 2.  Web deployment (httpd.yml)
Start Apache service using port 83 ：
```bash
ansible-playbook -i inventory httpd.yml
```
==Remark: How to write user manual==
``` vim http.1
.TH HTTP 1 "2026-06-28" "RHCE Manual" "User Commands"
.SH NAME
http \- Ansible Web Server Quick Deployment Guide
.SH SYNOPSIS
.B ansible-playbook httpd.yml
.SH DESCRIPTION
Deploy Apache web server to port 82 or 83 automatically.
.SH MAINTENANCE
# you have to vim httpd.yml and modify the port number that question needed.
```
Compress to  .gz ：
```
gzip http.1
```
move the .gz file to dedicated sub-directory：
```
sudo mv http.1.gz /usr/share/man/man1/
```
```
man http
```
<img width="1377" height="502" alt="image" src="https://github.com/user-attachments/assets/a2ba0f23-1043-4c38-87cd-94b11debc44f" />


