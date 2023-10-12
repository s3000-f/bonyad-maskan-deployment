setup:
	rm -rf code/bonyad*
	git clone git@github.com:s3000-f/bonyad-maskan-front.git code/frontend
	cp env/frontend/.env code/frontend/.env
	git clone git@github.com:s3000-f/bonyad-maskan.git code/backend
	cp env/backend/.env code/backend/.env	
	
setupUpdate:
	cd code/frontend && git pull
	cd code/backend && git pull
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