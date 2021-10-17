# debug or release
ver=debug

# decide compiling parameters by target platform
ifeq ($(ver),debug)
CXXFLAGS = -g -Ddebug
else
CXXFLAGS = -O3
endif

# building path settings
LIB_SRC_PATH = src/libs
INCLUDE_PATH = libs\lua\include
TARGET_PATH = bin

# building dependency files
LIB_SRC_FILES := $(wildcard $(LIB_SRC_PATH)/*.cpp)
LIB_INCLUDE_FILES := $(wildcard $(LIB_SRC_PATH)/*.h) $(wildcard $(LIB_SRC_PATH)/*.hpp)
EXT_LIBS = libs\lua\liblua54.a

# target .exe .o .lib files
EXE_NAME = lualab
EXE_FILE = $(TARGET_PATH)/$(EXE_NAME).exe

# default task, check directory and build .exe and .lib files
all:chkdir $(EXE_FILE) 

$(EXE_FILE) : src/main.cpp $(LIB_SRC_FILES)
	@echo Generating Executable : $@
	@g++ $^ $(EXT_LIBS) $(CXXFLAGS) -o $@ -I $(INCLUDE_PATH)

.PHONY : clean chkdir
clean:
	del $(TARGET_PATH)\*.exe
chkdir:
	@echo off
	@dir $(TARGET_PATH) || @mkdir $(TARGET_PATH)

