CC = gcc
OBJECTS = rcc.o

all: rcc_lex rcc

##### Compiler #####
rcc: $(OBJECTS)
	$(CC) $(OBJECTS) -o rcc

rcc.o: rcc.c
	$(CC) -c rcc.c -o rcc.o

##### Lexer #####
rcc_lex: lex.yy.c
	$(CC) lex.yy.c -o rcc_lex -lfl

lex.yy.c: foo.flex
	flex foo.flex
