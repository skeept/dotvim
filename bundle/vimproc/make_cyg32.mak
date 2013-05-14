# for MinGW.


CC=i686-pc-mingw32-gcc

TARGET=autoload/vimproc_win32.dll
SRC=autoload/proc_w32.c
CFLAGS=-O2 -Wall -shared -m32
LDFLAGS+=-lwsock32

all: $(TARGET)

$(TARGET): $(SRC) autoload/vimstack.c
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC) $(LDFLAGS)

clean:
	rm -f $(TARGET)
