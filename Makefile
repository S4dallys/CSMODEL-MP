CC = gcc

CFLAGS = -Wall

INC = -I./include

LIB = -lws2_32

OTHER_SRC = src/input.c
SERVER_SRC = src/server.c
CLIENT_SRC = src/client.c

OTHER_OBJ = $(OTHER_SRC:.c=.o)
SERVER_OBJ = $(SERVER_SRC:.c=.o)
CLIENT_OBJ = $(CLIENT_SRC:.c=.o)

SERVER_TARGET = server.exe
CLIENT_TARGET = client.exe

all: $(SERVER_TARGET) $(CLIENT_TARGET)

$(SERVER_TARGET): $(SERVER_OBJ) $(OTHER_OBJ)
	$(CC) $(CFLAGS) $^ $(LIB) -o $@

$(CLIENT_TARGET): $(CLIENT_OBJ) $(OTHER_OBJ)
	$(CC) $(CFLAGS) $^ $(LIB) -o $@

src/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< $(INC) -o $@

clean:
	rm -fv *.o *.exe src/*.o
