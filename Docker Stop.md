## Stop and Remove all hyperledger fabric docker images and volumes

### Stop Docker Images
- Navigate to hyperledger fabric ~/fabric-samples/test-network folder
    - cd ~/fabric-samples/test-network
- Use the command below to stop all docker images 
    - docker stop $(docker ps -a -q)
- Use the command below to remove all docker images
    - docker rm $(docker ps -a -q)

### Prune Docker volumes
- Use the command below to prune all docker volumes
    - docker volume prune