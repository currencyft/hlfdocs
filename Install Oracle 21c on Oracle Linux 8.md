Login as root
1. Check hostname
    $ hostname
    {host name appears here}
2. Create a swap file
    $ sudo dd if=/dev/zero of=/swapfile count=16096 bs=1MiB
    $ sudo chmod 600 /swapfile
    $ sudo mkswap /swapfile
    $ sudo swapon /swapfile
    $ sudo nano /etc/fstab
    Paste the following in the /etc/fstab
    /swapfile swap swap defaults 0 0
    $ sudo swapon --show
2. Add hostname and ip on /etc/hosts
    $ nano /etc/hosts
    hostipaddress hostnameabove {custom name}
3. Install the preinstall file
    $ yum list oracle-database-preinstall-21c
    $ yum install -y oracle-database-preinstall-21c
4. Set the oracle passwd
    $ passwd oracle
5. Set SELinux
    $ nano /etc/selinux/config
    #SELINUX=enforcing
    SELINUX=permissive
6. Stop Firewall
    $ sudo firewall-cmd --state
    $ sudo systemctl stop firewalld
    $ sudo systemctl disable firewalld
    $ sudo systemctl mask --now firewalld
    $ sudo systemctl firewall-cmd --state
7. Create database directory
    $ mkdir -p /u01/app/oracle/product/21.0.0/dhome_1
    $ mkdir -p /u02/oradata
    $ chown -R oracle:oinstall /u01 /u02
    $ chmod -R 775 /u01 /u02
Change to oracle user
8. Change to oracle user
    $ su - oracle
    $ cd /u02
    $ unzip -oq LINUX.ARM_213000_db_home.zip
    $ ls -ltr
    $ ./runInstaller


global database name: dbat21c
oracle system identifier: dbat21c
pluggable database name: dbatpdb

9. During Installer a popup asks for the two scripts to be run as root.
    - Copy the path of each script and paste in terminal and run the scripts as root. 
    - Press enter for the second script