vpath %.c ./Src
vpath %.h ./Inc
CC = gcc
SRC_PATH = ./Src/
LINK_TARGET = app.exe
INCLUDE_PATH = ./Inc/
OBJ = main.o LCD.o DIO.o
CLEAN_TARGET = $(LINK_TARGET) $(OBJ)
all:$(LINK_TARGET)
	echo Bulding done !
clean:
	-rm $(CLEAN_TARGET)
	echo Cleaning done !
$(LINK_TARGET): $(OBJ) Rizk_MinaRaouf_Wael_Khaled.o
# name of the specified object file should be explicitly added here
	$(CC) $(OBJ) Rizk_MinaRaouf_Wael_Khaled.o -o $@
# and here also
	echo Linking done !
#%.o: %.c
main.o : main.c main.h LCD.h DIO.h code.h
	$(CC) -c -I$(INCLUDE_PATH) $< -o $@
LCD.o : LCD.c LCD.h DIO.h code.h 
	$(CC) -c -I$(INCLUDE_PATH) $< -o $@
DIO.o : DIO.c DIO.h code.h
	$(CC) -c -I$(INCLUDE_PATH) $< -o $@