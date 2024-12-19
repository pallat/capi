CC = gcc
CFLAGS = -Wall -O2
LIBS = -lmicrohttpd

all: main

main: main.c
	$(CC) $(CFLAGS) -o main main.c $(LIBS)

clean:
	rm -f main

get-deps:
	apt-get update
	apt-get install -y libmicrohttpd-dev

docker-build:
	docker build -t my-c-app .

run:
	docker run -p 8888:8888 -it  my-c-app