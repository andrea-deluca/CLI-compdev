build: lib scanner parser
	javac -d build source/*.java

lib:
	javac -d build modules/java_cup/*.java
	javac -d build modules/java_cup/runtime/*.java

scanner:
	java -classpath ./build -jar modules/jflex/jflex-full-1.8.2.jar source/scanner.jflex -d source

parser:
	java -classpath ./build java_cup.Main -destdir source -parser Parser source/parser.cup

clean:
	del /f/r/s source\*.java
	del /f/r/s source\*.*~
	del /f/r/s build/*

init:
	mkdir source build modules
	touch source/scanner.jflex source/parser.cup

run:
	java -classpath ./build Parser input.txt