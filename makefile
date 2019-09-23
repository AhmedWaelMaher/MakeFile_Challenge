cc = gcc

#Folder of .C
SOURCE_PATH = ./Src
#Folder of .h
INC_PATH = ./Inc

vpath %.c $(SOURCE_PATH)

SOURCE_FILES = $(subst $(SOURCE_PATH)/,,$(wildcard $(SOURCE_PATH)/*.c))

#Folder of .d
Dependencies_PATH = .\Dependencies

#Dependencies variables
DEP_FILES1 = $(SOURCE_FILES:.c=.d)
DEP_FILES2 = $(addprefix $(Dependencies_PATH)\,$(DEP_FILES1))

#Object files
OBJECT_FILES1 = $(SOURCE_FILES:.c=.o)
OBJECT_FILES2 = Rizk_MinaRaouf_Wael_Khaled.o

Application = app.exe
CLEAN = $(OBJECT_FILES1) $(Application) $(DEP_FILES2)

#Implicit
%.o : %.c
	$(cc) -c -I$(INC_PATH) $< -o $@
	$(cc) -MM -I$(INC_PATH) $< > $(Dependencies_PATH)\$*.d

#Compilation
$(OBJECT_FILES1) : $(SOURCE_FILES)
	$(cc) -c $(SOURCE_FILES) -o $@

#Linking
$(Application) : $(OBJECT_FILES1) $(OBJECT_FILES2) #$(DEP_FILES2)
	$(cc) $^ -o $@

#Excecution
all : $(Application)