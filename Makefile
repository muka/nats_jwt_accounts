setup: clean
	docker-compose up -d
	docker run --network nats -v `pwd`/data/nsc:/nsc -v `pwd`/setup.sh:/setup.sh --rm -it synadia/nats-box /setup.sh

clean:
	docker-compose down | true
	sudo rm -rf ./data/nsc

nats:
	docker-compose up -d
	docker-compose logs -f

box:
	docker run --network nats -v `pwd`/data/nsc:/nsc --rm -it synadia/nats-box

push:
	docker run --network nats -v `pwd`/data/nsc:/nsc --rm -it --entrypoint nsc synadia/nats-box push --all --account-jwt-server-url http://nas:9090/jwt/v1
