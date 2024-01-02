## Re-install Hyperledger Fabric

### Navigate to existing installation
- Navigate to hyperledger fabric ~/fabric-samples/test-network folder
    - cd ~/fabric-samples/test-network
- Stop Hyperledger fabric
    - ./network.sh down

### Stop Docker Images

- Use the command below to stop all docker images 
    - docker stop $(docker ps -a -q)
- Use the command below to remove all docker images
    - docker rm $(docker ps -a -q)

### Prune Docker volumes
- Use the command below to prune all docker volumes
    - docker volume prune

### Delete all related docker images
- Open Docker Desktop
- Delete all the docker container associated with the hyperledger fabric if it exists

### Re-install Hyperledger Fabric
- Install hyperledger fabric version latest
    - curl -sSL https://bit.ly/2ysbOFE | bash -s

- The command above demonstrates how to download the production releases of the latest hyperledger fabric