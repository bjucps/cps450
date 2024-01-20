# Readme

This project contains a demonstration parser for a small ANTLR grammar.

## Install and Run

To build this project, execute:

```
gradlew install
```


To run this project, execute:

```
build/install/parser/bin/parser -ds -dp program.tiny
```

## Project Structure

* **/src/main/antlr/cps450/Tiny.g4** contains an ANTLR grammar
* **/src/main/java/cps450/Main.java** contains the main Java entry point
* **/src/main/java/cps450/MyTinyLexer.java** contains a subclassed TinyLexer that dumps tokens to stdout as they are read by the parser

