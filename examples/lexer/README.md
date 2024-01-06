# Readme

This project contains a demonstration scanner for a small ANTLR grammar.

## Install and Run

To build this project, execute:

```
gradlew install
```

To execute unit tests, execute:

```
gradlew test
```

To run this project, execute:

```
build/install/lexer/bin/lexer math.txt
```

## Project Structure

* **/src/main/antlr/cps450/Arithmetic.g4** contains an ANTLR grammar
* **/src/main/java/cps450/Main.java** contains the main Java entry point
* **/src/test/java/cps450/LexerTest.java** contains a unit test
* **/src/test/resources/cps450/lexertest.txt** contains a data file read by the unit test

