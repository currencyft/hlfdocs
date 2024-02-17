1. Install Redhat linux
2. Install net-tools from within the virtual machine
    yum install -y net-tools
3. Get the ip address of the vm
    ifconfig
4. Login through SSH from Macbook
    ssh root@ipaddress
5. Update Redhat 
    yum -y update
6.	Install apache2 server to test that you can access the client from your host machine
    sudo yum group install 'Basic Web Server'

7.	You need to Disable the Firewall. The Firewall stops the client from being accessed by the host machine. 

8.	Check if firewall is running
    sudo firewall-cmd –state

9.	Permanently disable the firewall with the following commands
    sudo systemctl stop firewalld
    sudo systemctl disable firewalld
    sudo systemctl mask --now firewalld

10.	Check if apache is up
    sudo systemctl status httpd.service

    Apache is still down. Not started yet.

11.	Now, Start the apache web server
    sudo systemctl start httpd

12.	Access the server from your host system {macbook}
    http://ipaddress/


13.	Create a SWAP SPACE and SWAPFILE

    1.	Create a 10gb swap space
    sudo dd if=/dev/zero of=/swapfile count=16096 bs=1MiB

    2.	Lock down the swap space 
    sudo chmod 600 /swapfile

    3.	Enable the swap space
    sudo mkswap /swapfile

    4.	Activate the swap
    sudo swapon /swapfile

    5.	Make the change permanent by opening the file “/etc/fstab” file
    sudo nano /etc/fstab

    6.	Paste the line below in the file above and save and exit
    /swapfile swap swap defaults 0 0

    7.	Verify that the swap is active by using the “swapon” command
    sudo swapon --show

13. Install Oracle Database PreInstall file

    curl -o oracle-database-preinstall-19c-1.0-3.el8.aarch64.rpm  https://yum.oracle.com/repo/OracleLinux/OL8/appstream/aarch64/getPackage/oracle-database-preinstall-19c-1.0-3.el8.aarch64.rpm

    yum -y localinstall oracle-database-preinstall-19c-1.0-3.el8.aarch64.rpm