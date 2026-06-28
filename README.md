# RHCE-II Ansible 

RHCE preparation

## 📌 Files

*   **`ansible.cfg`**：Ansible 主設定檔，定義了主機清單路徑及基本連線參數。
*   **`inventory`**：Controlled terminal definition
*   **`httpd.yml`**：自動化部署 Apache Web 服務的 Playbook（已配置自訂埠口 83）。
*   **`cent_lifecycle.yml`**：管理 CentOS 系統生命週期的 Playbook。
*   **`cent.yml` / `cent_absent.yml`**：CentOS 基礎環境配置與移除的相關腳本。
*   **`packages.sh`**：用於環境初始化或套件檢查的 Shell 腳本。


### 1. Preparation
確保您的控制節點（Control Node）已安裝 Ansible，且能夠透過 SSH 免密碼登入 `inventory` 中定義的所有受控節點。
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


