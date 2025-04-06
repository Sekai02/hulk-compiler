CC = g++
FLEX = flex
BISON = bison

SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build

all: compiler

compiler: $(BUILD_DIR)/parser.o $(BUILD_DIR)/lexer.o  $(BUILD_DIR)/main.o
	$(CC) -o $@ $^ -ll

$(BUILD_DIR)/lexer.o: $(SRC_DIR)/lexer.l
	$(FLEX) -o $(BUILD_DIR)/lex.yy.c $<
	$(CC) -c -I$(INCLUDE_DIR) $(BUILD_DIR)/lex.yy.c -o $@

$(BUILD_DIR)/parser.o: $(SRC_DIR)/parser.y
	$(BISON) -d -o $(BUILD_DIR)/parser.tab.c $<
	$(CC) -c -I$(INCLUDE_DIR) $(BUILD_DIR)/parser.tab.c -o $@

$(BUILD_DIR)/main.o: $(SRC_DIR)/main.cpp
	$(CC) -c -I$(INCLUDE_DIR) $< -o $@

clean:
	rm -f $(BUILD_DIR)/* compiler

.PHONY: all clean