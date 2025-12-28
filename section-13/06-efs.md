```bash
ssh -i ~/.aws/innerPeaceKey.pem ec2-user@52.79.217.132
cd /var/www/html/

sudo yum install -y amazon-efs-utils
fs-043509e9b68e94cb3:/ /var/www/html/images efs _netdev,noresvport,tls,accesspoint=fsap-03e44acf9a1b9ea60 0 0
```