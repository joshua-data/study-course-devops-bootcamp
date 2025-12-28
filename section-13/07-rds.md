
```bash
ssh -i ~/.aws/innerPeaceKey.pem ubuntu@43.201.38.78

apt update
apt install mysql-client -y

mysql -h vprofilemysqlserver.cvm6icmkgyj4.ap-northeast-2.rds.amazonaws.com \
    -u admin \
    -p
```

```sql
show databases;
```
