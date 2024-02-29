all :	 		build

%.o: %.cpp		
				$(CPP) $(FLAGS) -c $< -o $@

build:
				cd srcs && docker compose up -d;

rm:			
				docker system prune -af;

re:				rm all

.PHONY :		all rm re