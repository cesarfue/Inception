all: debug

up:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

debug:
	@docker compose -f ./srcs/docker-compose.yml up --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

start:
	@docker compose -f ./srcs/docker-compose.yml start

stop:
	@docker compose -f ./srcs/docker-compose.yml stop

ps :
	@docker ps

clean:
	@docker compose -f ./srcs/docker-compose.yml down --volumes
	@docker run --rm -v /home/cefuente/data:/data busybox sh -c "rm -rf /data/mariadb/* /data/wordpress/* /data/adminer/*"
	@docker image prune -af

re: clean
	@docker compose -f ./srcs/docker-compose.yml up --build

.PHONY: all up down start stop ps re clean
