Login as root
1. Create the /u01/software
    $ mkdir -p /u01/software

2. Assuming X dependencies already installed
    $ yum install xorg-x11-server-Xorg xorg-x11-xauth xorg-x11-apps nano -y

3. Ftp JDK to /u01/software
    $ sftp root@192.168.64.24
    $ put /Users/ge/soa/soainst/jdk*.jar /u01/software

3. Install Xclock and configure if not configured
    $ dnf config-manager --enable ol8_codeready_builder
    $ dnf install xorg-x11-apps xorg-x11-xauth nano

    Edit /etc/ssh/sshd_config and enable the following below

    $ nano /etc/ssh/sshd_config

    X11Forwarding yes
    X11DisplayOffset 10
    ClientAliveInterval 3600
    ClientAliveCountMax 10

    $ systemctl restart sshd
    $ sudo reboot

4. Login as oracle
    $ ssh -X oracle@192.168.64.24
    $ xclock
5. Untar the jdk 
    $ cd ~
    $ tar -xf /u01/software/jdk*.jar
    $ ls -ltr
6. Set JAVA_HOME
    $ JAVA_HOME=$HOME/jdk1.8.0_301
    $ export JAVA_HOME
7. Navigate to the installer director
    $ cd /u01/software
8. Run the installer
    $ $JAVA_HOME/bin/java -jar fmw_12.2.1.4.0_soa_quickstart.jar -install -invPtrLoc /etc/oraInst.loc