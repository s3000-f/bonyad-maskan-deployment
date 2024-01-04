setup:
	rm -rf code/bonyad*
	git clone git@github.com:s3000-f/bonyad-maskan-front.git code/frontend
	cp env/frontend/.env code/frontend/.env
	git clone git@github.com:s3000-f/bonyad-maskan.git code/main
	cp env/main/.env code/main/.env	
	git clone git@github.com:s3000-f/bonyad-survey.git code/survey
	cp env/survey/.env code/survey/.env
	git clone git@github.com:s3000-f/bonyad-auth.git code/auth
	cp env/auth/.env code/auth/.env	
	git clone git@github.com:s3000-f/bonyad-core.git code/core
	cp env/core/.env code/core/.env		
setupUpdate:
	cd code/frontend && git pull
	cd code/main && git pull
	cd code/survey && git pull
	cd code/auth && git pull
	cd code/core && git pull
updateFront:
	docker-compose up -d --no-deps --build frontend
update:
	docker-compose up -d --no-deps --build $(service)
run:
	docker-compose up -d

down:
	docker-compose down
cleanup:
	docker rmi --force $(shell docker images -a -q)
	docker system prune -f
removeAll: down cleanup

all: setup run
.PHONY: lint