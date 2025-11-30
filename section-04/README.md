# README — Linux Fundamentals 

*A practical reference for Linux basics, focusing on daily workflows in analytics engineering, data engineering, and devops-friendly environments.*

---

## 📌 3. Linux Principles (Important for Data Engineers)

* **Everything is a file**, including hardware devices
* Tools do **one thing well** (Unix philosophy)
* Command-line tools can be **chained** with pipes (`|`)
* Text-based configuration (Git-friendly, diff-friendly)
* Avoid GUI dependencies — ideal for servers

---

## 📌 4. Linux Architecture Overview

According to the architecture diagram on *page 2*:

* **Kernel** — manages hardware, memory, CPU
* **Shell** — the interface that interprets commands
* **Applications** — tools you run on top

Understanding this helps explain how dbt, Airflow, and Docker operate in containerized Linux environments.

---

## 📌 5. Linux Distributions (Distros)

### Common Server Distros

* **Ubuntu Server** (APT-based)
* **Red Hat / CentOS** (RPM-based)
* **SUSE**

Key differences:

* `.deb` packages → Debian/Ubuntu
* `.rpm` packages → Red Hat/CentOS

---

## 📌 6. Basic Navigation & Filesystem Commands

### List files

```sh
ls
ls -l     # long format
ls -a     # show hidden files
ls -ltr   # sort by time, reverse order
```

### Create directories

```sh
mkdir myfolder
mkdir -p parent/child   # create nested directories
```

### Create files

```sh
touch file1 file2
touch file{1..10}
```

### Move around

```sh
cd folder
cd ..       # go up
cd ~/       # go to home
cd /path    # absolute path
```

### Absolute vs Relative Paths

* **Absolute** starts with `/` — full path from root
* **Relative** based on current directory

---

## 📌 7. Copy / Move / Delete

```sh
cp file1 folder/
cp -r dir1 dir2/     # copy directories
mv file1 newname
rm file1
rm -r folder/
```

Use `-i` to avoid accidental deletion:

```sh
rm -i file
```

---

## 📌 8. VIM Basics (Very Important for Server Editing)

You’ll use VIM constantly when editing:

* dbt profiles
* Airflow configs
* Dockerfiles
* Env variables

### Enter insert mode

```
i
```

### Save & quit

```
:wq
```

### Quit without saving

```
:q!
```

### Useful motions

* `gg` → go to top
* `G` → go to bottom
* `dd` → delete line
* `yy` → copy line
* `p` → paste

---

## 📌 9. File Types in Linux

From the table in *page 12*:

| Symbol | Type         |
| ------ | ------------ |
| `-`    | Regular file |
| `d`    | Directory    |
| `l`    | Symlink      |
| `s`    | Socket       |
| `p`    | Pipe         |

Symlinks are like Windows shortcuts:

```sh
ln -s /var/log loglink
```

---

## 📌 10. Search & Filter Commands (Super Useful for Logs)

### grep — search text

```sh
grep root /etc/passwd
grep -i root /etc/passwd   # case-insensitive
grep -v root /etc/passwd   # exclude matches
```

### less — view large files

```sh
less /var/log/syslog
```

### head / tail

```sh
head -10 file
tail -20 file
tail -f file     # live log stream
```

### cut — extract columns

```sh
cut -d: -f1 /etc/passwd   # cut by delimiter :
```

### sed — find & replace

```sh
sed 's/old/new/g' file
```

---

## 📌 11. I/O Redirection (Essential for Logs & Pipeline Outputs)

```sh
command > file       # overwrite
command >> file      # append
command 2> error.log # error only
command &> all.log   # stdout + stderr
```

---

## 📌 12. Piping

The most powerful Linux concept for data engineers:

```sh
cat file | grep error | cut -d' ' -f3 | sort | uniq -c
```

This is the foundation of small, composable CLI pipelines — similar to dbt model chaining.

---

## 📌 13. Users & Groups (Important for Permission Issues)

Linux user types (page 19):

* **Root** — UID 0, full control
* **Regular Users** — UID 1000+
* **Service Accounts** — system-maintained

### Add user

```sh
sudo useradd sam
sudo passwd sam
```

### Add group

```sh
sudo groupadd devops
```

### Add user to group

```sh
sudo usermod -G devops sam
```

---

## 📌 14. File Permissions

### Numeric Mode (easier for engineers)

| Permission | Value |
| ---------- | ----- |
| read       | 4     |
| write      | 2     |
| execute    | 1     |

Example:

```sh
chmod 640 file
```

Meaning:

* `6` (4+2) → owner: read/write
* `4` → group: read
* `0` → others: none

---

## 📌 15. sudo and Privilege Escalation

Become root:

```sh
sudo -i
```

Edit sudoers (with visudo):

```sh
sudo visudo
```

Allow user without password:

```
sam ALL=(ALL) NOPASSWD:ALL
```

---

## 📌 16. Software Installation (APT / YUM / RPM)

### RPM (Red Hat / CentOS)

```sh
rpm -ivh package.rpm
rpm -qa          # list installed packages
rpm -qf /path    # find package owning file
```

### YUM (CentOS7)

```sh
yum install httpd -y
yum update -y
```

### DNF (CentOS8+)

```sh
dnf install vim -y
```

### APT (Ubuntu)

```sh
apt update
apt install apache2 -y
apt remove apache2 -y
```

---

## 📌 17. Systemctl — Managing Services (Very Important)

For CentOS (page 40):

```sh
sudo systemctl start httpd
sudo systemctl stop httpd
sudo systemctl enable httpd
sudo systemctl status httpd
```

For Ubuntu (page 41):

```sh
sudo systemctl start apache2
sudo systemctl status apache2
sudo systemctl is-enabled apache2
```

Useful when working with:

* Airflow
* cron services
* web servers
* dbt Cloud self-hosted runners

---

## 📌 18. Compression / Archiving (Basics)

```sh
tar -cvf archive.tar folder/
tar -xvf archive.tar

gzip file
gunzip file.gz
```

---

## 📌 19. Process Management

```sh
ps aux
top
htop (if installed)
kill -9 PID
```

Useful for debugging runaway processes or container issues.

---

# 🎯 Additional Notes for Analytics Engineers

As someone working with Linux for ELT pipelines, dbt, and server operations:

### You should be most comfortable with:

* Navigating quickly (`cd`, `ls`, `grep`, `find`)
* Editing config files (`vim`, `/etc/environment`, ssh config)
* Managing services (systemctl)
* Installing dependencies (apt/yum)
* Understanding permissions (`chmod`, `chown`)
* Reading logs (`tail -f`)

### You will use Linux for:

* Running dbt jobs locally & remotely
* Debugging Airflow/Dagster issues
* Managing cron-based ETL jobs
* Connecting to cloud instances (SSH)
* Working in Docker containers
* Moving files between systems (SCP / rsync)
* Parsing logs and outputs