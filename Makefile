CC=arm-linux-gnueabihf-gcc

obj-m := dht22.o

all: build poll

build:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

build/poll: src/poll.c
	$(CC) -o poll -lc -lpthread poll.c

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
