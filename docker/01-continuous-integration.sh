#continuous-intergration => refactor
git clone https://github.com/vfarcic/go-demo.git

cd go-demo

docker-machine create -d virtualbox go-demo

docker-machine env go-demo

eval $(docker-machine env go-demo)

cat docker-compose-test-local.yml

docker-compose \
    -f docker-compose-test-local.yml \
    run --rm unit

ls -l *go-demo*

docker build -t go-demo .

docker-compose \
    -f docker-compose-test-local.yml \
    build app

docker images

docker-compose \
    -f docker-compose-test-local.yml \
    up -d staging-dep

docker-compose \
    -f docker-compose-test-local.yml \
    ps

docker-compose \
    -f docker-compose-test-local.yml \
    run --rm staging

docker-compose \
    -f docker-compose-test-local.yml \
    down

docker-compose \
    -f docker-compose-test-local.yml \
    ps

docker-compose \
    -f docker-compose-local.yml \
    up -d registry

docker pull alpine

docker tag alpine localhost:5000/alpine

docker push localhost:5000/alpine

ls -1 docker/registry/v2/repositories/alpine/

docker tag go-demo localhost:5000/go-demo:1.0

docker push localhost:5000/go-demo:1.0

docker-machine rm -f go-demo