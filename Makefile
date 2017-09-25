PROJECT_DIR=.
INC_PATH=-I $(PROJECT_DIR)/include
LIB_PATH=-L $(PROJCET_DIR)/lib
LIBS=-lzmq
FLAGS=-std=c++11
CPP=g++

OBJECTS=log_proxy.o

TARGET=log_proxy

all:$(TARGET)

$(TARGET):$(OBJECTS)
	$(CPP) $(FLAGS) $(LIB_PATH) $(LIBS) $(INC_PATH) $< -o $@

include $(OBJECTS:.o=.d)

%.o: %.cpp
	$(CPP) -c $(FLAGS)  $(INC_PATH) $< -o $@

%.d: %.cpp
	set -e; rm -f $@; \
	$(CPP) -MM $(FLAGS) $(INC_PATH) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$
.PHONY:clean
clean:
	-rm  $(OBJECTS) *.d 
