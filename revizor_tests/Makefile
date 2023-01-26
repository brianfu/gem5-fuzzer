CC=g++
CFLAGS=-I. -I$(GEM5_PATH)/include
WFLAGS=-Wall
DFLAGS=-g -O0
LDFLAGS=-L$(GEM5_PATH)/util/m5/build/x86/out -lm5

OBJECTS = spectre_shell
DEPS = defines.h input.h

all: spectre_shell

spectre_shell:
	$(CC) -o $(OBJECTS) spectre_shell.cpp $(DEPS) $(CFLAGS) $(WFLAGS) $(DFLAGS) $(LDFLAGS)

.PHONY: clean
clean:
	rm -f *.o $(OBJECTS) spectre_shell spectre_shell_laptop