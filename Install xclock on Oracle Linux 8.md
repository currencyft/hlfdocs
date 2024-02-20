1. Enable the CodeReady-builder repository

# dnf config-manager --enable ol8_codeready_builder

2. Install the needed packages. This will pull also multiple required dependencies:

 # dnf install xorg-x11-apps xorg-x11-xauth

3. Edit sshd_config
    $ nano /etc/ssh/sshd_config
    
    X11Forwarding yes
    X11DisplayOffset 10
    ClientAliveInterval 3600
    ClientAliveCountMax 10

4. Restart sshd
    $ systemctl restart sshd

5. Reboot
    $ sudo reboot