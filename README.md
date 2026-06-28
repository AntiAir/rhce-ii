# RHCE-II Ansible 自動化專案 test II

本專案用於管理與部署自動化運維環境，主要包含針對 CentOS 系統的配置管理、服務部署（如 Apache HTTPD）以及系統生命週期管理的 Ansible Playbooks。

## 📌 專案檔案結構說明

*   **`ansible.cfg`**：Ansible 主設定檔，定義了主機清單路徑及基本連線參數。
*   **`inventory`**：主機清單檔案，記錄被控端節點的 IP 或主機名稱。
*   **`httpd.yml`**：自動化部署 Apache Web 服務的 Playbook（已配置自訂埠口 83）。
*   **`cent_lifecycle.yml`**：管理 CentOS 系統生命週期的 Playbook。
*   **`cent.yml` / `cent_absent.yml`**：CentOS 基礎環境配置與移除的相關腳本。
*   **`packages.sh`**：用於環境初始化或套件檢查的 Shell 腳本。

## 🚀 快速開始指南

### 1. 前置作業
確保您的控制節點（Control Node）已安裝 Ansible，且能夠透過 SSH 免密碼登入 `inventory` 中定義的所有受控節點。

### 2. 執行 Web 服務部署 (httpd.yml)
使用以下指令來執行 Apache 服務的自動化安裝與埠口 83 配置：
```bash
ansible-playbook -i inventory httpd.yml
```
## 註: 寫手冊
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
將檔案壓成系統認得的 .gz 格式：
```
gzip http.1
```
將壓縮檔放到系統手冊的指定子目錄下：
```
sudo mv http.1.gz /usr/share/man/man1/
```
```
man http
```
<img width="1377" height="502" alt="image" src="https://github.com/user-attachments/assets/a2ba0f23-1043-4c38-87cd-94b11debc44f" />

### 3. 執行系統生命週期管理 (cent_lifecycle.yml)
```bash
ansible-playbook -i inventory cent_lifecycle.yml -t install    # 增加軟體倉
ansible-playbook -i inventory cent_lifecycle.yml -t create     # 增加軟體倉
ansible-playbook -i inventory cent_lifecycle.yml -t remove     # 刪除軟體倉
ansible-playbook -i inventory cent_lifecycle.yml -t delete     # 刪除軟體倉
```

---
*本專案由 automation@control 進行版本控制與維護。*
