name = inception_2024

.DEFAULT_GOAL = all
 
env:
	./make_env.sh

certs:
	./make_certs.sh

all:
	@printf "Launching ${name}...\n"
	@bash srcs/requirements/wordpress/tools/make_db_dirs.sh
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

build:
	@printf "Building  ${name}...\n"
	@bash srcs/requirements/wordpress/tools/make_db_dirs.sh
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env build

down:
	@printf "Stopping ${name}...\n"
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re: fclean env
	@printf "Rebuilding  ${name}...\n"
	@bash srcs/requirements/wordpress/tools/make_db_dirs.sh
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
	@printf "Cleaning  ${name}...\n"
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env --volumes down 
	@docker container prune --force
	@docker image prune --force
	@sudo rm -rf ~/data/mariadb/*
	@sudo rm -rf ~/data/wordpress/*

fclean: down
	@printf "Clean of all docker configs\n"
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env down --volumes
	@docker image prune --all --force
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	# @rm srcs/.env srcs/requirements/nginx/tools/*
	@sudo rm -rf ~/data
 
.PHONY : all build down re clean fclean info env certs