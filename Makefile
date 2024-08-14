all: up

up:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

start:
	@docker-compose -f ./srcs/docker-compose.yml start

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop

ps :
	@docker ps

re:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

clean:
	@docker-compose -f ./srcs/docker-compose.yml down --volumes
	@docker container prune -f

.PHONY: all up down start stop ps re clean
