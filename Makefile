CXX = g++
CXXFLAGS = -g3 -Wall -g3 -fopenmp
MKDIR = mkdir -p

LIBS=-lm -fopenmp

directorios: 
	$(MKDIR) build dist

menu.o: directorios menu.cpp menu.h
	$(CXX) $(CXXFLAGS) -c -MMD -MP -MF .d menu.cpp -o build/menu.o

main.o: directorios main.cpp
	$(CXX) $(CXXFLAGS) -c -MMD -MP -MF .d main.cpp -o build/main.o

Matriz.o: directorios Matriz.cpp Matriz.h
	$(CXX) $(CXXFLAGS) -c -MMD -MP -MF .d Matriz.cpp -o build/Matriz.o

all: clean main.o menu.o Matriz.o
	$(CXX) $(CXXFLAGS) $(LIBS) -o dist/programa build/main.o build/menu.o build/Matriz.o
	rm -fr build

clean:
	rm -fr *.o a.out programa dist build

.DEFAULT_GOAL := all