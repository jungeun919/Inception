NAME = inception
VOLUME_PATH :=  ./srcs/requirements/tools/data

all: $(NAME)

$(NAME):
	mkdir -p $(VOLUME_PATH)/mariadb/
	mkdir -p $(VOLUME_PATH)/wordpress/
	docker-compose -f ./srcs/docker-compose.yml up --build -d

up:
	docker-compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	make down
	docker system prune -f

fclean: clean
	rm -rf $(VOLUME_PATH)

re:
	make fclean
	make all

.PHONY: all up down clean fclean re
