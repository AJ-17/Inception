DOCKER_COMPOSE_PATH	= srcs/docker-compose.yml

all :	 		build up


build :
				sudo docker-compose -f $(DOCKER_COMPOSE_PATH) build

up:
				cd srcs && sudo docker-compose up -d;

rm:			
				sudo docker-compose -f $(DOCKER_COMPOSE_PATH) down --volumes --rmi all
				sudo docker system prune -af;
				sudo rm -rf /home/ajakubcz/data/mariadb/*;
				sudo rm -rf /home/ajakubcz/data/wordpress/*;

re:				rm all

.PHONY :		all rm re