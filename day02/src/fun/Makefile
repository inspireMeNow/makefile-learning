LINK = @echo linking $@ && g++
GCC = @echo compiling $@ && g++
GC = @echo compiling $@ && gcc
FLAGS = -g -DDEBUG -W -Wall -fPIC
GCCFLAGS = 
DEFINES = 
HEADER = -I./
LIBS = 

# 生成动态库
LINKFLAGS = -shared

LIBS += -pthread

OBJECT := fun.o

BIN_PATH = ../../bin

# 生成的文件名
TARGET = libfun.so

$(TARGET) : $(OBJECT)
	$(LINK) $(FLAGS) $(LINKFLAGS) -o $@ $^ $(LIBS)

.cpp.o:
	$(GCC) -c $(HEADER) $(FLAGS) $(GCCFLAGS) -fpermissive -o $@ $<

.c.o:
	$(GC) -c $(HEADER) $(FLAGS) -fpermissive -o $@ $<

install: $(TARGET)
	cp $(TARGET) $(BIN_PATH)

clean:
	rm -rf $(TARGET) *.o *.so