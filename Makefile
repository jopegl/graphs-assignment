# Responsável: P3
CXX      := g++
CXXFLAGS := -std=c++17 -O2 -Wall -Wextra -Iinclude

SRC   := $(shell find src -name '*.cpp')
OBJ   := $(patsubst src/%.cpp,build/%.o,$(SRC))
LIB   := $(filter-out build/main.o,$(OBJ))
TESTS := $(patsubst tests/%.cpp,bin/%,$(wildcard tests/*.cpp))

all: bin/arvore

bin/arvore: $(OBJ)
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) $^ -o $@

build/%.o: src/%.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c $< -o $@

bin/test_%: tests/test_%.cpp $(LIB)
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) $^ -o $@

testes: $(TESTS)
	@for t in $(TESTS); do ./$$t || exit 1; done

clean:
	rm -rf build bin

.PHONY: all testes clean
