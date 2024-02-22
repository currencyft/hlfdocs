export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=/u01/app/oracle/product/19.0.0/dbhome_1
export ORACLE_HOSTNAME={ip address}
export ORA_INVENTORY=/u01/app/oraInventory

./runInstaller -ignorePrereq -waitforcompletion -silent             \
    -responseFile ${ORACLE_HOME}/install/response/db_install.rsp    \
    oracle.install.option=INSTALL_DB_SWONLY                         \
    ORACLE_HOSTNAME=${ORACLE_HOSTNAME}                              \
    UNIX_GROUP_NAME=oinstall                                        \
    INVENTORY_LOCATION=${ORA_INVENTORY}                             \
    SELECTED_LANGUAGES=en,en_GB                                     \
    ORACLE_HOME=${ORACLE_HOME}                                      \
    ORACLE_BASE=${ORACLE_BASE}                                      \
    oracle.install.db.InstallEdition=EE                             \
    oracle.install.db.OSDBA_GROUP=dba                               \
    oracle.install.db.OSBACKUPDBA_GROUP=backupdba                   \
    oracle.install.db.OSDGDBA_GROUP=dgdba                           \
    oracle.install.db.OSKMDBA_GROUP=kmdba                           \
    oracle.install.db.OSRACDBA_GROUP=racdba                         \
    SECURITY_UPDATES_VIA_MYORACLESUPPORT=false                      \
    DECLINE_SECURITY_UPDATES=true