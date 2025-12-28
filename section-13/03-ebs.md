### Write this code when creating the ec2 instance.

```bash
#!/bin/bash

#!/bin/bash

yum install httpd wget unzip -y

systemctl start httpd
systemctl enable httpd

cd /tmp
wget https://www.tooplate.com/zip-templates/2119_gymso_fitness.zip
unzip -o 2119_gymso_fitness.zip
cp -r 2119_gymso_fitness/* /var/www/html/

systemctl restart httpd
```

### Connect to the instance.

```bash
chmod 400 ~/.aws/Moso-dev-seoul.pem
ssh -i ~/.aws/Moso-dev-seoul.pem ec2-user@54.180.122.81
```

### Check the connected hard disks connected to the instance.

```bash
fdisk -l
df -h

fdisk /dev/xvdf
```