#continuous-intergration => refactor
git clone git@github.com:badjina/laravel-demo.git ==> refactor to happyhafla

cd laravel-demo ==> refactor to happyhafla

docker-machine create -d virtualbox laravel-demo

docker-machine env laravel-demo

eval $(docker-machine env laravel-demo)

cat docker-compose-test-local.yml

docker-compose \
    -f docker-compose-test-local.yml \
    run --rm unit

docker build -t  laravel-demo .


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

docker tag laravel-demo badjina/laravel-demo:1.0

docker push badjina/laravel-demo:1.0

docker-machine rm -f laravel-demo