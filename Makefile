NAME = inception
VOLUME_PATH :=  ./srcs/requirements/tools/data

all: $(NAME)

$(NAME):
	sudo chmod 777 /etc/hosts
	if ! grep -q "127.0.0.1 jungchoi.42.fr" /etc/hosts; then \
	echo "127.0.0.1 jungchoi.42.fr" >> /etc/hosts; \
	fi
	mkdir -p $(VOLUME_PATH)/mariadb/
	mkdir -p $(VOLUME_PATH)/wordpress/
	sudo docker-compose -f ./srcs/docker-compose.yml up --build -d

up:
	sudo docker-compose -f ./srcs/docker-compose.yml up --build -d

down:
	sudo docker-compose -f ./srcs/docker-compose.yml down

clean:
	sudo docker-compose -f ./srcs/docker-compose.yml down
	sudo docker system prune -f

fclean:
	sudo docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes
	sudo docker system prune -f
	sudo rm -rf $(VOLUME_PATH)

re:
	make fclean
	make all

.PHONY: all up down clean fclean re
