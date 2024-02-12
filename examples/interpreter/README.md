# Readme

This project contains an interpreter for the Tiny language.

## Install and Run

To build this project, execute:

```
gradlew install
```


To run this project, execute:

```
build/install/interpreter/bin/interpreter -ds -dp program.tiny
```

## Project Structure

* **/src/main/antlr/cps450/Tiny.g4** contains an ANTLR grammar
* **/src/main/java/cps450/Main.java** contains the main Java entry point
* **/src/main/java/cps450/TinyInterpreter.java** contains a Listener class that implements an interpreter for Tiny
* **/src/main/java/cps450/TinyInterpreterVisitor.java** contains a Visitor class that implements an interpreter for Tiny

