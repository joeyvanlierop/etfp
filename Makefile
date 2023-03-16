.PHONY: clean

all: eftpclient eftpserver

eftpclient: client.o file.o messages.o 
	g++ -g client.o file.o messages.o -o eftpclient

eftpserver: server.o session.o file.o messages.o 
	g++ -g server.o session.o file.o messages.o -o eftpserver

client.o: src/client.cpp src/client.h
	g++ -c src/client.cpp

server.o: src/server.cpp src/server.h
	g++ -c src/server.cpp

session.o: src/session.cpp src/session.h
	g++ -c src/session.cpp

file.o: src/file.cpp src/file.h
	g++ -c src/file.cpp

messages.o: src/messages.cpp src/messages.h
	g++ -c src/messages.cpp

clean:
	-rm *.o eftpclient eftpserver

zip: client server
	zip -r JosephVanLierop.zip client/ server/ Makefile