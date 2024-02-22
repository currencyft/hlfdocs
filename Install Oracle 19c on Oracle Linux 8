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
    $ systemctl restart sshd
    $ sudo reboot
3. Install the preinstall file
    $ yum list oracle-database-preinstall-19c
    $ yum install -y oracle-database-preinstall-19c
4. Set the oracle passwd
    $ passwd oracle
5. Set the oracle database
    $ mkdir -p /u01/app/oracle/product/19.19/db_home
    $ chown -R oracle:oinstall /u01
    $ chmod -R 775 /u01
6. Switch to oracle user
    $ su - oracle
    $ nano ~/.bash_profile
    delete everything inside the .bash_profile file
    add the following below
    export ORACLE_BASE=/u01/app/oracle
    export ORACLE_HOME=/u01/app/oracle/product/19.19/db_home
    export ORACLE_SID=COB
    export LD_LIBRARY_PATH=\$ORACLE_HOME/lib:/lib:/usr/lib
    export CLASSPATH=\$ORACLE_HOME/jlib:\$ORACLE_HOME/rdbms/jlib
    export NLS_LANG=american_america.al32utf8
    export NLS_DATE_FORMAT="yyyy-mm-dd:hh24:mi:ss"
    PATH=$PATH:$HOME/.local/bin:$ORACLE_HOME/bin
    export PATH

7. Save and exit
    Press escape
    Type :wq
    Press enter

8. Learn more from the bash profile
    $ more .bash_profile
9. Source the bash profile
    $ source ~/.bash_profile

10. Exit and login with root user

11. Login with root user
    $ ssh root@192.168.64.24
12. Install Xclock
    $ dnf config-manager --enable ol8_codeready_builder
    $ dnf install -y xorg-x11-server-Xorg xorg-x11-xauth 
    $ dnf install -y xorg-x11-apps


    Edit /etc/ssh/sshd_config and enable the following below

    $ nano /etc/ssh/sshd_config
    $ systemctl restart sshd
    $ sudo reboot

    X11Forwarding yes
    X11DisplayOffset 10
    ClientAliveInterval 3600
    ClientAliveCountMax 10

13. Open a new tab and upload downloaded oracle installer
    sftp root@192.168.64.24 
    sftp> put /Users/eth/ge/soa/soainst/LINUX.ARM*19* /u01/app/oracle/product/19.19/db_home

14. On the main tab, navigate to the oracle installer folder
    $ cd /u01/app/oracle/product/19.19/db_home

15. Unzip the installer still as root and grant privilege to oracle user
    $ unzip -qo LINUX.ARM*19*
    $ chmod -R 775 /u01
    $ chown -R oracle:oinstall /u01

16. Open a new terminal window and login as oracle user
    $ ssh -X oracle@192.168.64.25
    $ cd /u01/app/oracle/product/19.19/db_home

17. Run the installer as oracle user
    ./runInstaller

18. On Configuration Option
    Click on Next
19. On System Class
    Select "Desktop Class"
    Click on Next
20. On "Typical Install"
    Oracle base: /u01/app/oracle
    Software location: /u01/app/oracle/product/19.19/db_home
    Database file location: /u01/app/oracle/oradata
    Database edition: Enterprise Edition
    Character set: AL32UTF8
    OSDBA group: dba
    Global database name: orcl
    Password: codercoder
    Pluggable database name: orclpdb
21. On "Create Inventory"
    Inventory Directory: /u01/app/oraInventory
    oraInventory Group Name: oinstall

    Click Next
22. On "Automatically Run Scripts"
    Click on "Automatically run configuration scripts"
    Type root password

    Click Next

23. On "Summary"
    Click Install

    A pop up appears requesting to run some scripts as root. 
    Click Yes

24. On "Finish"
    Click Close

25. Start Oracle
    $ export ORACLE_SID=orcl
    $ sqlplus / as sysdba
    $ startup
    $ select instance_name,status from v$instance;
    $ shutdown


