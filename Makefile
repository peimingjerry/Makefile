
ROOT		:=  .

include $(ROOT)/build.variables

# Files
EXE		:= test
SRC		:= main.c
OBJ		:= $(patsubst %.c, %.o, $(SRC))
OBJ		:= $(OBJ_DIR)/$(strip $(OBJ))

# Libraries
LIB_NAME	:= linkage
LIB_DIR		:= $(OBJ_DIR)
LIB_FLAG	:= -lc
LIB_FLAG	+= $(addprefix -L, $(strip $(LIB_DIR)))
LIB_FLAG	+= $(addprefix -l, $(strip $(LIB_NAME)))

# Link
$(EXE): $(LIB_NAME) $(OBJ)
	$(WHISPER) $(ECHO) "Linking" $(EXE)
	$(WHISPER) $(LD) -o $(EXE) $(OBJ) $(LIB_FLAG)
	$(WHISPER) $(ECHO) "Build Done!!!"

# Compile source files
INCLUDE_DIRS:= -I$(ROOT)/linkage
include $(ROOT)/build.rules

# Build libraries
REC_DIRS	:= $(LIB_NAME)
include $(ROOT)/recursive.rules

# CleanUp
# TODO: delete multiple library in REC_DIRS
clean:
	$(WHISPER) $(MAKE) $(CD_FLAG) -C $(REC_DIRS) clean
	$(WHISPER) $(ECHO) "Cleaning $(EXE)"
	$(RM) $(EXE) $(OBJ)
	$(WHISPER) $(ECHO) "Clean Done!!!"
