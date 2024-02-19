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

13. Add host entry
    nano /etc/hosts
    {ip address} soa
    sudo reboot



14. Install Oracle Database PreInstall file

    curl -o oracle-database-preinstall-19c-1.0-3.el8.aarch64.rpm  https://yum.oracle.com/repo/OracleLinux/OL8/appstream/aarch64/getPackage/oracle-database-preinstall-19c-1.0-3.el8.aarch64.rpm

    yum -y localinstall oracle-database-preinstall-19c-1.0-3.el8.aarch64.rpm

15. Set password for oracle
    passwd oracle

16. Disable SELINUX
    nano /etc/selinux/config
    #SELINUX=enforcing
    SELINUX=disabled

17. Install all xterm package to get the graphical packages for installation
    yum -y install xterm* xorg*

18. Create a home directory
    mkdir -p /u01/app/oracle/product/19.0.0/dbhome_1
    mkdir -p /u02/oradata 
    chown -R oracle:oinstall /u01 /u02
    chmod -R 775 /u01 /u02

19. Reboot
    sudo reboot

20. Login again
    ssh -X root@ipaddress
    xhost +

21. Create a folder for oracle required variables and create setEnv.sh
    mkdir /home/oracle/scripts 
    nano /home/oracle/scripts/setEnv.sh

    Copy the item below to the setEnv.sh.

    export TMP=/tmp
    export TMPDIR=$TMP
    export ORACLE_HOSTNAME=localhost
    export ORACLE_UNQNAME=XEPDB1
    export ORACLE_BASE=/u01/app/oracle
    export ORACLE_HOME=$ORACLE_BASE/product/19.0.0/dbhome_1
    export ORA_INVENTORY=/u01/app/oraInventory
    export ORACLE_SID=XEPDB1
    export PDB_NAME=XEPDB1
    export DATA_DIR=/u02/oradata
    export PATH=/usr/sbin:/usr/local/bin:$PATH
    export PATH=$ORACLE_HOME/bin:$PATH
    export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib
    export CLASSPATH=$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib

22. Make setEnv.sh a start up script
    echo ". /home/oracle/scripts/setEnv.sh" >> /home/oracle/.bash_profile

23. Give permission to Oracle user to run the script
    chown -R oracle:oinstall /home/oracle/scripts
    chmod u+x /home/oracle/scripts/*.sh

24. Download the Oracle Database and upload it to /tmp

    https://www.oracle.com/database/technologies/oracle19c-linux-arm64-downloads.html

    {LINUX.ARM64_1919000_db_home.zip} is downloaded
    {Oracle Database 19c (19.19) for LINUX ARM (aarch64)}

    sftp /Users/{user}/{download_location}/LINUX.ARM64_1919000_db_home.zip

25. Move the dowloaded oracle database from /tmp to ORACLE_HOME
    sudo mv /tmp/LINUX.ARM*19* /u01/app/oracle/product/19.0.0/dbhome_1

26. Login as oracle
    ssh -X oracle@ipaddress

27. Enter the command below
    DISPLAY={ipaddress}:0.0; export DISPLAY

28. Echo the DISPLAY variable
    echo $DISPLAY

29. Echo the ORACLE_HOME variable
    echo $ORACLE_HOME

30. Unzip the downloaded Oracle database
    cd /u01/app/oracle/product/19.0.0/dbhome_1
    unzip -oq LINUX.ARM64_1919000_db_home.zip

31. Change directory to cv/admin
    cd cv/admin

32. Edit the cvu_config file
    nano cvu_config

    Edit the line
    #CV_ASSUME_DISTID=OL7
    to
    CV_ASSUME_DISTID=RHEL7.9
    {this is to avoid problems during installation}

33. Go back to ORACLE_HOME folder
    cd ../../
    {/u01/app/oracle/product/19.0.0/dbhome_1}

34. Execute runInstaller
    ./runInstaller
