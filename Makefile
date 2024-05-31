DOCKER_COMPOSE_PATH	= srcs/docker-compose.yml

all :	 		build up


build :
				mkdir -p /home/ajakubcz/data/wordpress
				mkdir -p /home/ajakubcz/data/mariadb
				sudo docker compose -f $(DOCKER_COMPOSE_PATH) build

up:
				sudo docker compose -f $(DOCKER_COMPOSE_PATH) up -d;

rm:			
				sudo docker compose -f $(DOCKER_COMPOSE_PATH) down --volumes --rmi all
				sudo rm -rf /home/ajakubcz/data/mariadb/*;
				sudo rm -rf /home/ajakubcz/data/wordpress/*;

rmf:			rm
				sudo docker system prune -af;

re:				rm all

.PHONY :		all build up rm rmf re