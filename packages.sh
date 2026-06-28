#!/bin/bash

# 💡 核心模組說明：
# -m yum_repository：Ansible 專門用來管理軟體倉配置檔（.repo）的內建模組。
# -a "..."          ：模組的參數，定義軟體倉的名稱、路徑與啟用狀態。
# -b (或 --become)   ：極度重要！代表以 root 身分進行提權執行。

# 1. 批次建立 CentOS Stream 10 BaseOS 軟體倉
ansible all -m yum_repository -a "name=CentOS_BaseOS description='CentOS Stream 10 BaseOS' baseurl='https://centos.org' enabled=yes gpgcheck=yes gpgkey='https://centos.orgRPM-GPG-KEY-centosofficial'" -b

# 2. 批次建立 CentOS Stream 10 AppStream 軟體倉
ansible all -m yum_repository -a "name=CentOS_AppStream description='CentOS Stream 10 AppStream' baseurl='https://centos.org' enabled=yes gpgcheck=yes gpgkey='https://centos.orgRPM-GPG-KEY-centosofficial'" -b
