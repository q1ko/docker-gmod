meant for the homies

docker build . -t img

docker run -it -p 27015:27015/udp -p 27015:27015/tcp img --name srv
