```bash
cd /multi-vms
vagrant ssh web01

sudo -i
apt install net-tools
ifconfig
ip addr show

ping 192.168.56.43 -c 5 # db01 vm
vi /etc/hosts
echo "192.168.56.43 db01" >> /etc/hosts
ping db01 -c 5

logout
logout
traceroute www.google.com # use this to identify where latency increases.

vagrant ssh web01
sudo -i
netstat -antp

ss -tunlp

apt install nmap
nmap localhost # use this to find the opened ports.
nmap db01

dig www.google.com
nslookup www.google.com

route -n # use this to see the gateways.

arp # use this to see the mac addresses.

mtr
mtr www.google.com

nmap db01
telnet 192.168.56.43 22 # connect to db01 with the SSH port.
```