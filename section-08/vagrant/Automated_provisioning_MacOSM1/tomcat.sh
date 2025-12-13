#!/bin/bash
sudo -i

dnf update -y
dnf -y install java-17-openjdk java-17-openjdk-devel
dnf install git wget rsync unzip zip -y

cd /tmp/

TOM_VER="10.1.26"
TOM_TAR="apache-tomcat-${TOM_VER}.tar.gz"
TOM_URL="https://archive.apache.org/dist/tomcat/tomcat-10/v${TOM_VER}/bin/${TOM_TAR}"
TOM_OUT="tomcatbin.tar.gz"

wget $TOM_URL -O $TOM_OUT

EXT_OUT=`tar xzvf ${TOM_OUT}`
TOM_DIR=`echo $EXT_OUT | cut -d '/' -f1`

useradd --home-dir /usr/local/tomcat --shell /sbin/nologin tomcat
rsync -avzh /tmp/$TOM_DIR/ /usr/local/tomcat/
chown -R tomcat.tomcat /usr/local/tomcat

rm -rf /etc/systemd/system/tomcat.service
cat <<EOT > /etc/systemd/system/tomcat.service

[Unit]
Description=Tomcat
After=network.target

[Service]
User=tomcat
Group=tomcat
WorkingDirectory=/usr/local/tomcat
#Environment=JRE_HOME=/usr/lib/jvm/jre
Environment=JAVA_HOME=/usr/lib/jvm/jre
Environment=CATALINA_PID=/var/tomcat/%i/run/tomcat.pid
Environment=CATALINA_HOME=/usr/local/tomcat
Environment=CATALINE_BASE=/usr/local/tomcat
ExecStart=/usr/local/tomcat/bin/catalina.sh run
ExecStop=/usr/local/tomcat/bin/shutdown.sh
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target

EOT

systemctl daemon-reload
systemctl start tomcat
systemctl enable tomcat

systemctl start firewalld
systemctl enable firewalld
firewall-cmd --get-active-zones
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --reload

cd /tmp/
wget https://archive.apache.org/dist/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.zip
unzip apache-maven-3.9.9-bin.zip
cp -r apache-maven-3.9.9 /usr/local/maven3.9
export MAVEN_OPTS="-Xmx512m"

git clone -b local https://github.com/hkhcoder/vprofile-project.git
cd vprofile-project
/usr/local/maven3.9/bin/mvn install

systemctl stop tomcat
sleep 20
rm -rf /usr/local/tomcat/webapps/ROOT*
cp target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war

systemctl start tomcat
sleep 20

chown tomcat.tomcat /usr/local/tomcat/webapps -R
systemctl restart tomcat