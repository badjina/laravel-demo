#docker-swarm

// add version to images and containers
docker-compose -f docker-compose-test-local.yml run —rm unit

docker build -f docker/Dockerfile -t laravel-demo .

for i in 1 2 3; do
    docker-machine create -d virtualbox node-$i;
done

eval $(docker-machine env node-1)

docker swarm init --advertise-addr $(docker-machine ip node-1)

TOKEN=$(docker swarm join-token -q worker)

for i in 2 3; do 
eval $(docker-machine env node-$i);
docker swarm join --token $TOKEN --advertise-addr $(docker-machine ip node-$i) $(docker-machine ip node-1):2377;
done

eval $(docker-machine env node-1)

docker node ls

docker network create --driver overlay laravel-demo

docker network ls

docker service create --name laravel-demo-db --network laravel-demo postgres

docker service ls

docker service inspect laravel-demo-db

docker service create --name laravel-demo -e DB=laravel-demo-db --network laravel-demo badjina/laravel-demo:1.0

docker service ls

docker service scale go-demo=5

docker service ls

docker service ps go-demo

docker-machine rm -f node-3

docker service ps go-demo

docker-machine rm -f node-1 node-2
