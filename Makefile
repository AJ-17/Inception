DOCKER_COMPOSE_PATH	= srcs/docker-compose.yml

all :	 		build

%.o: %.cpp		
				$(CPP) $(FLAGS) -c $< -o $@

build:
				cd srcs && sudo docker compose up -d;

rm:			
				docker compose -f $(DOCKER_COMPOSE_PATH) down --volumes --rmi all
				docker system prune -af;
				rm -rf /home/ajakubcz/data/mariadb/*;
				rm -rf /home/ajakubcz/data/wordpress/*;

re:				rm all

.PHONY :		all rm re