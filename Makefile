CC = gcc

CFLAGS = -Wall 

INC = -I./include

LIB = -lws2_32

SRC = $(wildcard src/*.c)

OBJ = $(SRC:.c=.o)

TARGET = app.exe

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $^ $(LIB) -o $@

src/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< $(INC) -o $@

clean:
	rm -fv *.o *.exe src/*.o
